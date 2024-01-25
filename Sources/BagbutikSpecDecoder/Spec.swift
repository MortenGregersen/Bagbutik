import Foundation

/// A representation of the spec file
public struct Spec: Decodable {
    /// The paths contained in the spec
    public var paths: [String: Path]
    /// The components contained in the spec
    public var components: Components

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        paths = try container.decode([String: Path].self, forKey: .paths)
        components = try container.decode(Components.self, forKey: .components)
    }

    init(paths: [String: Path], components: Components) throws {
        self.paths = paths
        self.components = components
    }

    /**
     Adds include parameters which looks like they are forgotten in the spec.

     This is done by adding the name of the properties in the Relationships on the response schema.
     Eg. ListAppInfosForApp doesn't list the different types of categories.
     */
    public mutating func addForgottenIncludeParameters() {
        paths.forEach { (pathKey: String, path: Path) in
            var path = path
            path.operations.forEach { operation in
                let operationIndex = path.operations.firstIndex(of: operation)!
                var operation = operation
                let responseSchemaName = operation.successResponseType
                guard case .object(let responseSchema) = components.schemas[responseSchemaName] else { return }
                let dataSchemaName: String
                guard let dataProperty = responseSchema.properties["data"] else { return }
                if case .arrayOfSchemaRef(let theDataSchemaName) = dataProperty.type {
                    dataSchemaName = theDataSchemaName
                } else if case .schemaRef(let theDataSchemaName) = dataProperty.type {
                    dataSchemaName = theDataSchemaName
                } else { return }
                guard case .object(let dataSchema) = components.schemas[dataSchemaName],
                      case .schema(let dataRelationshipsSchema) = dataSchema.properties["relationships"]?.type
                else { return }
                let includeNamesFromResponse = dataRelationshipsSchema.properties.map(\.key)
                operation.parameters?.forEach { parameter in
                    guard let parameterIndex = operation.parameters?.firstIndex(of: parameter),
                          case .include(let parameterValueType) = parameter,
                          case .enum(let includeType, let includeValues) = parameterValueType
                    else { return }
                    let allValues = Array(Set<String>(includeValues).union(includeNamesFromResponse)).sorted()
                    operation.parameters?[parameterIndex] = .include(type: .enum(type: includeType, values: allValues))
                }
                path.operations[operationIndex] = operation
            }
            paths[pathKey] = path
        }
    }

    /**
     Flatten the schemas used in schemas for create request and update request and in filter parameters when they are identical to the schemas used in main type.

     Eg. CreateProfile.Attributes.ProfileType is equal to Profile.Attributes.ProfileType, the first one should be removed and the latter one should be used.
     */
    public mutating func flattenIdenticalSchemas() {
        paths.forEach { (pathKey: String, path: Path) in
            var path = path
            path.operations.forEach { operation in
                let operationIndex = path.operations.firstIndex(of: operation)!
                var operation = operation
                operation.parameters?
                    .forEach { parameter in
                        guard let parameterIndex = operation.parameters?.firstIndex(of: parameter),
                              case .filter(let parameterName, let parameterValueType, let parameterRequired, let parameterDocumentation) = parameter,
                              case .enum(let type, let values) = parameterValueType else { return }
                        let parameterEnumSchema = EnumSchema(name: parameterName.capitalizingFirstLetter(), type: type.lowercased(), caseValues: values)
                        var newType: String?
                        if let enumSchema: EnumSchema = components.schemas.compactMap({ _, schema in
                            if case .enum(let enumSchema) = schema, enumSchema.cases == parameterEnumSchema.cases {
                                return enumSchema
                            }
                            return nil
                        }).first {
                            newType = enumSchema.name
                            var enumSchema = enumSchema
                            enumSchema.additionalProtocols.insert("ParameterValue")
                            components.schemas[enumSchema.name] = .enum(enumSchema)
                        } else if case .object(var mainSchema) = components.schemas[path.info.mainType],
                                  case .objectSchema(var mainAttributesSchema) = mainSchema.subSchemas.first(where: { $0.name == "Attributes" }),
                                  let propertyInfo = mainAttributesSchema.properties.compactMap({ (propertyName: String, mainAttributesProperty: Property) -> (name: String, schema: EnumSchema)? in
                                      guard case .enumSchema(let mainAttributesPropertySchema) = mainAttributesProperty.type,
                                            mainAttributesPropertySchema.cases == parameterEnumSchema.cases else { return nil }
                                      return (name: propertyName, schema: mainAttributesPropertySchema)
                                  }).first {
                            newType = "\(path.info.mainType).Attributes.\(propertyInfo.name.capitalizingFirstLetter())"
                            var enumSchema = propertyInfo.schema
                            enumSchema.additionalProtocols.insert("ParameterValue")
                            mainAttributesSchema.properties[propertyInfo.name]?.type = .enumSchema(enumSchema)
                            mainSchema.properties["attributes"]?.type = .schema(mainAttributesSchema)
                            components.schemas[path.info.mainType] = .object(mainSchema)
                        }
                        if let newType {
                            operation.parameters?[parameterIndex] = .filter(name: parameterName, type: .simple(type: .init(type: newType)), required: parameterRequired, documentation: parameterDocumentation)
                        }
                    }
                path.operations[operationIndex] = operation
            }
            paths[pathKey] = path
        }
        ["CreateRequest", "UpdateRequest"].forEach { suffix in
            components.schemas
                .filter { $0.key.hasSuffix(suffix) }
                .forEach { (targetSchemaName: String, targetSchema: Schema) in
                    // targetSchema: The schema to change, to use a schema ref instead of duplicate sub schema
                    // mainSchema: The schema containing the only sub schema, which the targetSchema should refer to
                    guard case .object(var targetSchema) = targetSchema else { return }
                    let mainSchemaName = String(targetSchemaName.dropLast(suffix.lengthOfBytes(using: .utf8)))
                    guard case .object(let mainSchema) = components.schemas[mainSchemaName],
                          let targetDataProperty = targetSchema.properties["data"],
                          case .schema(var targetDataSchema) = targetDataProperty.type,
                          case .schema(var targetDataAttributesSchema) = targetDataSchema.properties["attributes"]?.type
                    else { return }
                    targetDataAttributesSchema.properties.forEach { (targetDataAttributesPropertyName: String, targetDataAttributesProperty: Property) in
                        guard case .enumSchema(let targetDataAttributesPropertySchema) = targetDataAttributesProperty.type,
                              case .objectSchema(let mainAttributesSchema) = mainSchema.subSchemas.filter({ $0.name == "Attributes" }).first,
                              mainAttributesSchema.properties.contains(where: { (_: String, mainAttributesProperty: Property) in
                                  guard case .enumSchema(let mainAttributesPropertySchema) = mainAttributesProperty.type else { return false }
                                  return mainAttributesPropertySchema.name == targetDataAttributesPropertySchema.name
                                      && mainAttributesPropertySchema.cases == targetDataAttributesPropertySchema.cases
                              }) else { return }
                        targetDataAttributesSchema.properties[targetDataAttributesPropertyName] = .init(type: .schemaRef("\(mainSchemaName).Attributes.\(targetDataAttributesPropertySchema.name)"), deprecated: targetDataAttributesProperty.deprecated)
                    }
                    targetDataSchema.properties["attributes"]?.type = .schema(targetDataAttributesSchema)
                    targetSchema.properties["data"] = .init(type: .schema(targetDataSchema), deprecated: targetDataProperty.deprecated)
                    components.schemas[targetSchemaName] = .object(targetSchema)
                }
        }
    }

    /**
     Applies manual patches for types not adhering to the general conventions of the spec.

     Eg. ErrorResponse has an OneOf with references to ErrorSourcePointer and ErrorSourceParameter, but these schemas have a different title, and have another name when generated.
     */
    public mutating func applyManualPatches() throws {
        // Remove all paths with no operations
        paths = paths.filter { $0.value.operations.count > 0 }

        // Add the cases `UNIVERSAL` and `SERVICES` to BundleIdPlatform
        // Apple's OpenAPI spec doesn't include Universal App IDs. Reported to Apple 21/1/21 as FB8977648.
        // Apple's OpenAPI spec doesn't include Service IDs (like "Sign in with Apple"). Reported to Apple 14/10/22 as a later comment on FB8977648.
        if case .enum(var bundleIdPlatformSchema) = components.schemas["BundleIdPlatform"] {
            if !bundleIdPlatformSchema.cases.contains(where: { $0.value == "SERVICES" }) {
                bundleIdPlatformSchema.cases.append(EnumCase(id: "services", value: "SERVICES", documentation: "A string that represents a service."))
            }
            if !bundleIdPlatformSchema.cases.contains(where: { $0.value == "UNIVERSAL" }) {
                bundleIdPlatformSchema.cases.append(EnumCase(id: "universal", value: "UNIVERSAL", documentation: "A string that represents iOS and macOS."))
            }
            components.schemas["BundleIdPlatform"] = .enum(bundleIdPlatformSchema)
        }

        // Add the case `PROCESSING` to Device.Status
        // Apple's OpenAPI spec doesn't include Processing as status for Device.
        if case .object(var deviceSchema) = components.schemas["Device"],
           var deviceAttributesSchema: ObjectSchema = deviceSchema.subSchemas.compactMap({
               guard case .objectSchema(let subSchema) = $0,
                     subSchema.name == "Attributes" else {
                   return nil
               }
               return subSchema
           }).first,
           var statusProperty = deviceAttributesSchema.properties["status"],
           case .enumSchema(var statusEnum) = statusProperty.type {
            var values = statusEnum.cases
            values.append(.init(id: "processing", value: "PROCESSING"))
            statusEnum.cases = values
            statusProperty.type = .enumSchema(statusEnum)
            deviceAttributesSchema.properties["status"] = statusProperty
            deviceSchema.properties["attributes"]?.type = .schema(deviceAttributesSchema)
            components.schemas["Device"] = .object(deviceSchema)
        }

        // Add the case `GENERATE_INDIVIDUAL_KEYS` to UserRole
        // Apple's OpenAPI spec doesn't include the role for generating individual keys. Reported to Apple 17/1/24 as FB13546172.
        if case .enum(var userRoleSchema) = components.schemas["UserRole"] {
            if !userRoleSchema.cases.contains(where: { $0.value == "GENERATE_INDIVIDUAL_KEYS" }) {
                userRoleSchema.cases.append(EnumCase(id: "generateIndividualKeys", value: "GENERATE_INDIVIDUAL_KEYS"))
            }
            components.schemas["UserRole"] = .enum(userRoleSchema)
        }

        // Add the case `VISION_OS` to Platform
        // Apple's OpenAPI spec doesn't include visionOS for App Categories. Reported to Apple 28/8/23 as FB13071298.
        if case .enum(var platformSchema) = components.schemas["Platform"] {
            if !platformSchema.cases.contains(where: { $0.value == "VISION_OS" }) {
                platformSchema.cases.append(EnumCase(id: "visionOS", value: "VISION_OS", documentation: "A string that represents visionOS."))
            }
            components.schemas["Platform"] = .enum(platformSchema)
        }

        // Add the `APP_APPLE_VISION_PRO` to ScreenshotDisplayType
        // Apple's OpenAPI spec doesn't include visionOS for Screenshot Display Types. Reported to Apple 14/1/24 as FB13539766.
        if case .enum(var screenshotDisplayTypeSchema) = components.schemas["ScreenshotDisplayType"] {
            if !screenshotDisplayTypeSchema.cases.contains(where: { $0.value == "APP_APPLE_VISION_PRO" }) {
                screenshotDisplayTypeSchema.cases.append(EnumCase(id: "appAppleVisionPro", value: "APP_APPLE_VISION_PRO"))
            }
            screenshotDisplayTypeSchema.cases.sort(by: { $0.id < $1.id })
            components.schemas["ScreenshotDisplayType"] = .enum(screenshotDisplayTypeSchema)
        }

        // Change the shcema ref of the `data` property on *WithoutIncludesResponse
        // Apple's OpenAPI spec and docs almost all the respones have wrong schema ref. Reported to Apple 14/1/24 as FB13540097.
        let schemaNamesWithoutIncludesResponses = components.schemas.keys.filter { $0.hasSuffix("WithoutIncludesResponse") }
        schemaNamesWithoutIncludesResponses.forEach { schemaName in
            var schemaRefName = schemaName
                .replacingOccurrences(of: "WithoutIncludesResponse", with: "")
                .replacingOccurrences(of: "PreRelease", with: "Prerelease")
            if case .object(var responseSchema) = components.schemas[schemaName] {
                if schemaRefName.hasSuffix("s") {
                    if schemaRefName.hasSuffix("ies") {
                        schemaRefName = schemaRefName.replacingOccurrences(of: "ies", with: "y")
                    } else {
                        schemaRefName = String(schemaRefName.dropLast(1))
                    }
                    responseSchema.properties["data"]?.type = .arrayOfSchemaRef(schemaRefName)
                } else {
                    responseSchema.properties["data"]?.type = .schemaRef(schemaRefName)
                }
                components.schemas[schemaName] = .object(responseSchema)
            }
        }

        // Fix up the names of the sub schemas of ErrorResponse.Errors
        guard case .object(var errorResponseSchema) = components.schemas["ErrorResponse"],
              let errorsProperty = errorResponseSchema.properties["errors"],
              case .arrayOfSubSchema(var errorSchema) = errorsProperty.type,
              var sourceProperty = errorSchema.properties["source"],
              case .oneOf(let sourcePropertyName, var sourceOneOfSchema) = sourceProperty.type,
              let pointerIndex = sourceOneOfSchema.options.firstIndex(of: .schemaRef("ErrorSourcePointer")),
              let parameterIndex = sourceOneOfSchema.options.firstIndex(of: .schemaRef("ErrorSourceParameter"))
        else {
            throw SpecError.unexpectedErrorResponseSource(components.schemas["ErrorResponse"])
        }
        sourceOneOfSchema.options[pointerIndex] = .schemaRef("JsonPointer")
        sourceOneOfSchema.options[parameterIndex] = .schemaRef("Parameter")
        sourceProperty.type = .oneOf(name: sourcePropertyName, schema: sourceOneOfSchema)
        errorSchema.properties["source"] = sourceProperty

        // Mark `detail` as optional on ErrorResponse.Errors
        // In Apple's OpenAPI spec the `detail` property on `ErrorResponse.Errors` is marked as `required`.
        // On 12/1/23 some errors (with status code 409) has been observed, with no `detail`.
        errorSchema.requiredProperties.removeAll(where: { $0 == "detail" })

        // Add `associatedErrors` to the `meta` property on ErrorResponse.Errors
        // In Apple's OpenAPI spec and documentation the `meta` property does not include the `associatedErrors` (last checked 26/1/24).
        // But it is observed when creating a ReviewSubmissionItem with an AppStoreVersion fails.
        if let metaProperty = errorSchema.properties["meta"],
           case .dictionary = metaProperty.type {
            errorSchema.properties["meta"] = Property(type: .schema(.init(
                name: "Meta",
                url: "",
                properties: [
                    "associatedErrors": .init(type: .dictionary(.arrayOfSchemaRef("Errors"))),
                    "additionalProperties": metaProperty
                ])))
        }

        errorResponseSchema.properties["errors"]?.type = .arrayOfSubSchema(errorSchema)
        components.schemas["ErrorResponse"] = .object(errorResponseSchema)
    }

    /// A wrapper for schemas to ease decoding
    public struct Components: Decodable {
        /// A list of schema names and their representation
        public var schemas: [String: Schema]
    }

    private enum CodingKeys: String, CodingKey {
        case paths
        case components
    }
}

/// Errors that can occur when loading the spec
public enum SpecError: Error {
    /// The declaration of ErrorResponse.Source is not as expected
    case unexpectedErrorResponseSource(Schema?)
}

extension SpecError: Equatable {}

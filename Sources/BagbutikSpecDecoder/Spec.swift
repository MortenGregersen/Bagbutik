import Foundation

/// A representation of the spec file
public struct Spec: Decodable {
    /// The paths contained in the spec
    public var paths: [String: Path]
    /// The components contained in the spec
    public var components: Components
    /// The schemas patched manually
    public private(set) var patchedSchemas = [Schema]()

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
     Flatten the schemas used in schemas for create request and update request and in filter parameters when they are identical to the schemas used in main type.

     Eg. ProfileCreateRequest.Attributes.ProfileType is equal to Profile.Attributes.ProfileType, the first one should be removed and the latter one should be used.
     */
    public mutating func flattenIdenticalSchemas() {
        for (pathKey, path) in paths {
            var path = path
            for operation in path.operations {
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
                            if case .enum(let enumSchema) = schema, enumSchema.cases.map(\.value) == parameterEnumSchema.cases.map(\.value) {
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
        for suffix in ["CreateRequest", "UpdateRequest"] {
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
                    for (targetDataAttributesPropertyName, targetDataAttributesProperty) in targetDataAttributesSchema.properties {
                        guard case .enumSchema(let targetDataAttributesPropertySchema) = targetDataAttributesProperty.type,
                              case .objectSchema(let mainAttributesSchema) = mainSchema.subSchemas.filter({ $0.name == "Attributes" }).first,
                              mainAttributesSchema.properties.contains(where: { (_: String, mainAttributesProperty: Property) in
                                  guard case .enumSchema(let mainAttributesPropertySchema) = mainAttributesProperty.type else { return false }
                                  return mainAttributesPropertySchema.name == targetDataAttributesPropertySchema.name
                                      && mainAttributesPropertySchema.cases == targetDataAttributesPropertySchema.cases
                              }) else { continue }
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
        paths = paths.filter { !$0.value.operations.isEmpty }

        // Add the case `SERVICES` to BundleIdPlatform
        // Apple's OpenAPI spec doesn't include Service IDs (like "Sign in with Apple"). Reported to Apple 14/10/22 as a later comment on FB8977648.
        if case .enum(var bundleIdPlatformSchema) = components.schemas["BundleIdPlatform"] {
            if !bundleIdPlatformSchema.cases.contains(where: { $0.value == "SERVICES" }) {
                bundleIdPlatformSchema.cases.append(EnumCase(id: "services", value: "SERVICES", documentation: "A string that represents a service."))
            }
            components.schemas["BundleIdPlatform"] = .enum(bundleIdPlatformSchema)
            patchedSchemas.append(.enum(bundleIdPlatformSchema))
        }
        let pathsMissingServicesPlatformParameter = ["/v1/bundleIds", "/v1/devices"]
        for path in pathsMissingServicesPlatformParameter {
            if var getPath = paths[path],
               let operationIndex = getPath.operations.firstIndex(where: { $0.method == .get }),
               let parameterIndex = getPath.operations[operationIndex].parameters?.firstIndex(where: {
                   if case .filter(let name, _, _, _) = $0 {
                       name == "platform"
                   } else {
                       false
                   }
               }),
               case .filter(let name, let type, let required, let documentation) = getPath.operations[operationIndex].parameters?[parameterIndex],
               case .enum(let valueType, var values) = type {
                var operation = getPath.operations[operationIndex]
                values.append("SERVICES")
                operation.parameters?[parameterIndex] = .filter(
                    name: name,
                    type: .enum(type: valueType, values: values),
                    required: required,
                    documentation: documentation)
                getPath.operations[operationIndex] = operation
                paths[path] = getPath
            }
        }

        if case .object(var deviceSchema) = components.schemas["Device"],
           var deviceAttributesSchema: ObjectSchema = deviceSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
               guard case .objectSchema(let subSchema) = subSchema,
                     subSchema.name == "Attributes" else {
                   return nil
               }
               return subSchema
           }).first {
            // Add the case `PROCESSING` to Device.Status
            // Apple's OpenAPI spec doesn't include Processing as status for Device.
            if var statusProperty = deviceAttributesSchema.properties["status"],
               case .enumSchema(var statusEnum) = statusProperty.type {
                var values = statusEnum.cases
                values.append(EnumCase(id: "processing", value: "PROCESSING"))
                statusEnum.cases = values
                statusProperty.type = PropertyType.enumSchema(statusEnum)
                deviceAttributesSchema.properties["status"] = statusProperty
                deviceSchema.properties["attributes"]?.type = .schema(deviceAttributesSchema)
                components.schemas["Device"] = .object(deviceSchema)
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

        // FB12292035: Mark `detail` as optional on ErrorResponse.Errors
        // In Apple's OpenAPI spec the `detail` property on `ErrorResponse.Errors` is marked as `required`.
        // On 12/1/23 some errors (with status code 409) has been observed, with no `detail`.
        errorSchema.requiredProperties.removeAll(where: { $0 == "detail" })

        // FB12292035: Add `associatedErrors` to the `meta` property on ErrorResponse.Errors
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

        errorResponseSchema.additionalProtocols.insert("Error")
        errorResponseSchema.properties["errors"]?.type = .arrayOfSubSchema(errorSchema)
        components.schemas["ErrorResponse"] = .object(errorResponseSchema)
        patchedSchemas.append(.object(errorResponseSchema))

        // Marks the `kidsAgeBand` property on `AgeRatingDeclarationUpdateRequest.Data.Attributes` as clearable.
        // Apple's OpenAPI spec has no information about how to clear a value in an update request.
        // To tell Apple to clear a value, it has to be `null`, but properties with `null` values normally get omitted.
        if case .object(var ageRatingDeclarationUpdateRequestSchema) = components.schemas["AgeRatingDeclarationUpdateRequest"],
           var ageRatingDeclarationUpdateRequestDataSchema: ObjectSchema = ageRatingDeclarationUpdateRequestSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
               guard case .objectSchema(let subSchema) = subSchema, subSchema.name == "Data" else { return nil }
               return subSchema
           }).first,
           var ageRatingDeclarationUpdateRequestDataAttributesSchema: ObjectSchema = ageRatingDeclarationUpdateRequestDataSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
               guard case .objectSchema(let subSchema) = subSchema, subSchema.name == "Attributes" else { return nil }
               return subSchema
           }).first,
           let kidsAgeBandProperty = ageRatingDeclarationUpdateRequestDataAttributesSchema.properties["kidsAgeBand"] {
            ageRatingDeclarationUpdateRequestDataAttributesSchema.properties["kidsAgeBand"] = .init(type: kidsAgeBandProperty.type, deprecated: kidsAgeBandProperty.deprecated, clearable: true)
            ageRatingDeclarationUpdateRequestDataSchema.properties["attributes"]?.type = .schema(ageRatingDeclarationUpdateRequestDataAttributesSchema)
            ageRatingDeclarationUpdateRequestSchema.properties["data"]?.type = .schema(ageRatingDeclarationUpdateRequestDataSchema)
            components.schemas["AgeRatingDeclarationUpdateRequest"] = .object(ageRatingDeclarationUpdateRequestSchema)
            patchedSchemas.append(.object(ageRatingDeclarationUpdateRequestSchema))
        }

        // FB16699896: Adds XKS (Kosovo) to the list of `TerritoryCode`s.
        // Apple's OpenAPI spec doesn't include the country code for Kosovo in the list of codes.
        if case .enum(var territoryCode) = components.schemas["TerritoryCode"] {
            territoryCode.cases.append(.init(id: "xks", value: "XKS"))
            components.schemas["TerritoryCode"] = .enum(territoryCode)
            patchedSchemas.append(.enum(territoryCode))
        }
        let pathsMissingKosovoTerritoryCode = [
            "/v1/appStoreVersions/{id}/customerReviews",
            "/v1/apps/{id}/customerReviews"
        ]
        for path in pathsMissingKosovoTerritoryCode {
            if var getCustomerReviews = paths[path],
               let operationIndex = getCustomerReviews.operations.firstIndex(where: { $0.method == .get }),
               let parameterIndex = getCustomerReviews.operations[operationIndex].parameters?.firstIndex(where: {
                   if case .filter(let name, _, _, _) = $0 {
                       name == "territory"
                   } else {
                       false
                   }
               }),
               case .filter(let name, let type, let required, let documentation) = getCustomerReviews.operations[operationIndex].parameters?[parameterIndex],
               case .enum(let valueType, var values) = type {
                var operation = getCustomerReviews.operations[operationIndex]
                values.append("XKS")
                operation.parameters?[parameterIndex] = .filter(
                    name: name,
                    type: .enum(type: valueType, values: values),
                    required: required,
                    documentation: documentation)
                getCustomerReviews.operations[operationIndex] = operation
                paths[path] = getCustomerReviews
            }
        }

        // FB16908301: Adds list of `PurchaseRequirement` to `AppEvent`.
        if case .object(var appEventSchema) = components.schemas["AppEvent"],
           case .schema(var appEventAttributesSchema) = appEventSchema.properties["attributes"]?.type,
           var purchaseRequirementProperty = appEventAttributesSchema.properties["purchaseRequirement"],
           case .simple = purchaseRequirementProperty.type {
            let purchaseRequirementEnum = EnumSchema(name: "PurchaseRequirement", type: "String", caseValues: ["NO_COST_ASSOCIATED", "IN_APP_PURCHASE"])
            purchaseRequirementProperty.type = .enumSchema(purchaseRequirementEnum)
            appEventAttributesSchema.properties["purchaseRequirement"] = purchaseRequirementProperty
            appEventSchema.properties["attributes"]?.type = .schema(appEventAttributesSchema)
            components.schemas["AppEvent"] = .object(appEventSchema)
            patchedSchemas.append(.object(appEventSchema))
        }

        // FB17874677: Adds "INFREQUENT_OR_MILD" and "FREQUENT_OR_INTENSE" to AgeRatingDeclaration.Attributes properties.
        // FB17925890: Adds "ageRatingOverride" property to AgeRatingDeclaration.Attributes.
        let fixAgeRatingDeclarationAttributes = { (ageRatingDeclarationAttributesSchema: inout ObjectSchema) in
            let missingCases = [
                EnumCase(id: "infrequentOrMild", value: "INFREQUENT_OR_MILD"),
                EnumCase(id: "frequentOrIntense", value: "FREQUENT_OR_INTENSE")
            ]
            for (propertyName, property) in ageRatingDeclarationAttributesSchema.properties {
                if case .enumSchema(var enumSchema) = property.type,
                   enumSchema.cases.count == 1,
                   enumSchema.cases.first?.value == "NONE" {
                    var property = property
                    enumSchema.cases.append(contentsOf: missingCases)
                    property.type = .enumSchema(enumSchema)
                    ageRatingDeclarationAttributesSchema.properties[propertyName] = property
                }
            }
            if ageRatingDeclarationAttributesSchema.properties["ageRatingOverride"] == nil {
                ageRatingDeclarationAttributesSchema.properties["ageRatingOverride"] = .init(
                    type: .enumSchema(EnumSchema(
                        name: "AgeRatingOverride",
                        type: "String",
                        caseValues: ["NONE", "SEVENTEEN_PLUS", "UNRATED"])))
            }
        }
        if case .object(var ageRatingDeclarationSchema) = components.schemas["AgeRatingDeclaration"],
           case .schema(var ageRatingDeclarationAttributesSchema) = ageRatingDeclarationSchema.properties["attributes"]?.type {
            fixAgeRatingDeclarationAttributes(&ageRatingDeclarationAttributesSchema)
            ageRatingDeclarationSchema.properties["attributes"]?.type = .schema(ageRatingDeclarationAttributesSchema)
            components.schemas["AgeRatingDeclaration"] = .object(ageRatingDeclarationSchema)
            patchedSchemas.append(.object(ageRatingDeclarationSchema))
        }
        if case .object(var ageRatingDeclarationUpdateRequestSchema) = components.schemas["AgeRatingDeclarationUpdateRequest"],
           case .schema(var dataSchema) = ageRatingDeclarationUpdateRequestSchema.properties["data"]?.type,
           case .schema(var ageRatingDeclarationAttributesSchema) = dataSchema.properties["attributes"]?.type {
            fixAgeRatingDeclarationAttributes(&ageRatingDeclarationAttributesSchema)
            dataSchema.properties["attributes"]?.type = .schema(ageRatingDeclarationAttributesSchema)
            ageRatingDeclarationUpdateRequestSchema.properties["data"]?.type = .schema(dataSchema)
            components.schemas["AgeRatingDeclarationUpdateRequest"] = .object(ageRatingDeclarationUpdateRequestSchema)
            patchedSchemas.append(.object(ageRatingDeclarationUpdateRequestSchema))
        }

        // FB17932433: Adds "totalNumberOfCodes" property to SubscriptionOfferCode.Attributes.
        if case .object(var subscriptionOfferCodeSchema) = components.schemas["SubscriptionOfferCode"],
           case .schema(var subscriptionOfferCodeAttributesSchema) = subscriptionOfferCodeSchema.properties["attributes"]?.type {
            if subscriptionOfferCodeAttributesSchema.properties["totalNumberOfCodes"] == nil {
                subscriptionOfferCodeAttributesSchema.properties["totalNumberOfCodes"] = .init(type: .simple(.integer()))
            }
            subscriptionOfferCodeSchema.properties["attributes"]?.type = .schema(subscriptionOfferCodeAttributesSchema)
            components.schemas["SubscriptionOfferCode"] = .object(subscriptionOfferCodeSchema)
            patchedSchemas.append(.object(subscriptionOfferCodeSchema))
        }
        let pathsMissingTotalNumberOfCodesFieldParameter = [
            "/v1/subscriptionOfferCodes/{id}",
            "/v1/subscriptions/{id}",
            "/v1/subscriptionGroups/{id}/subscriptions",
            "/v1/subscriptionOfferCodes/{id}/customCodes",
            "/v1/subscriptionOfferCodes/{id}/oneTimeUseCodes",
            "/v1/subscriptions/{id}/offerCodes",
        ]
        for path in pathsMissingTotalNumberOfCodesFieldParameter {
            if var getPath = paths[path],
               let operationIndex = getPath.operations.firstIndex(where: { $0.method == .get }),
               let parameterIndex = getPath.operations[operationIndex].parameters?.firstIndex(where: {
                   if case .fields(let name, _, _, _) = $0 {
                       name == "subscriptionOfferCodes"
                   } else {
                       false
                   }
               }),
               case .fields(let name, let type, let deprecated, let documentation) = getPath.operations[operationIndex].parameters?[parameterIndex],
               case .enum(let valueType, var values) = type {
                var operation = getPath.operations[operationIndex]
                values.append("totalNumberOfCodes")
                operation.parameters?[parameterIndex] = .fields(
                    name: name,
                    type: .enum(type: valueType, values: values),
                    deprecated: deprecated,
                    documentation: documentation)
                getPath.operations[operationIndex] = operation
                paths[path] = getPath
            }
        }

        // Remove "StringToStringMap" - this is replaced with a [String: String] in the generated code
        components.schemas.removeValue(forKey: "StringToStringMap")
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

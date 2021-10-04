import Foundation

/// A representation of the spec file
public struct Spec: Decodable {
    /// The paths contained in the spec
    public var paths: [String: Path]
    /// The components contained in the spec
    public var components: Components
    /// Fix ups for the includes on the schemas based the field parameters of a the path operations
    public var includesFixUps: [String: [String]] {
        paths.values.reduce(into: [:]) { result, path in
            path.operations.forEach { operation in
                let fields = operation.parameters?.compactMap { parameter -> [String]? in
                    guard case .fields(let paramName, let type, _, _) = parameter else { return nil }
                    let paramNameOverrides = ["appPrices": "prices", "ciBuildRuns": "buildRuns", "ciWorkflows": "workflows"]
                    let name = paramNameOverrides[paramName] ?? paramName
                    if let lastSlashIndex = path.path.lastIndex(of: "/"),
                       name == path.path.suffix(from: path.path.index(after: lastSlashIndex)),
                       case .enum(_, let values) = type
                    {
                        return values
                    }
                    return [name]
                }.flatMap { $0 } ?? []
                let includesValues = operation.parameters?.compactMap { parameter -> [String]? in
                    guard case .include(let type) = parameter,
                          case .enum(_, let values) = type else { return nil }
                    return values
                }.flatMap { $0 } ?? []
                let allFixUps = fields + includesValues
                guard allFixUps.count > 0 else { return }
                let currentFixUps = result[operation.successResponseType] ?? []
                result[operation.successResponseType] = currentFixUps + allFixUps
            }
        }
    }

    /// Flatten the schemas used in schemas for create request and update request and in filter parameters when they are identical to the schemas used in main type.
    /// Eg. CreateProfile.Attributes.ProfileType is equal to Profile.Attributes.ProfileType, the first one should be removed and the latter one should be used
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
                              case .enum(let type, let values) = parameterValueType,
                              case .object(let mainSchema) = components.schemas[path.info.mainType],
                              let mainAttributesSchema = mainSchema.subSchemas.compactMap({ $0.asAttributes }).first,
                              mainAttributesSchema.properties.contains(where: { (_: String, mainAttributesProperty: Property) in
                                  guard case .enumSchema(let mainAttributesPropertySchema) = mainAttributesProperty.type else { return false }
                                  let parameterEnumSchema = EnumSchema(name: parameterName.capitalizingFirstLetter(), type: type.lowercased(), caseValues: values)
                                  let equal = mainAttributesPropertySchema == parameterEnumSchema
                                  return equal
                              })
                        else { return }
                        operation.parameters?[parameterIndex] = .filter(name: parameterName, type: .simple(type: .init(type: "\(path.info.mainType).Attributes.\(parameterName.capitalizingFirstLetter())")), required: parameterRequired, documentation: parameterDocumentation)
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
                          let targetDataIndex = targetSchema.subSchemas.firstIndex(of: .objectSchema(targetDataSchema)),
                          var targetDataAttributesSchema = targetDataSchema.subSchemas.compactMap({ $0.asAttributes }).first,
                          let targetDataAttributesIndex = targetDataSchema.subSchemas.firstIndex(of: .attributes(targetDataAttributesSchema))
                    else { return }
                    targetDataAttributesSchema.properties.forEach { (targetDataAttributesPropertyName: String, targetDataAttributesProperty: Property) in
                        guard case .enumSchema(let targetDataAttributesPropertySchema) = targetDataAttributesProperty.type,
                              let mainAttributesSchema = mainSchema.subSchemas.compactMap({ $0.asAttributes }).first,
                              mainAttributesSchema.properties.contains(where: { (_: String, mainAttributesProperty: Property) in
                                  guard case .enumSchema(let mainAttributesPropertySchema) = mainAttributesProperty.type else { return false }
                                  return mainAttributesPropertySchema == targetDataAttributesPropertySchema
                              }) else { return }
                        targetDataAttributesSchema.properties[targetDataAttributesPropertyName] = .init(type: .schemaRef("\(mainSchemaName).Attributes.\(targetDataAttributesPropertySchema.name)"), deprecated: targetDataAttributesProperty.deprecated)
                        targetDataAttributesSchema.subSchemas.removeAll { subSchema in
                            guard case .enumSchema(let subSchema) = subSchema else { return false }
                            return subSchema.name == targetDataAttributesPropertySchema.name
                        }
                    }
                    targetDataSchema.subSchemas[targetDataAttributesIndex] = .attributes(targetDataAttributesSchema)
                    targetSchema.properties["data"] = .init(type: .schema(targetDataSchema), deprecated: targetDataProperty.deprecated)
                    targetSchema.subSchemas[targetDataIndex] = .objectSchema(targetDataSchema)
                    components.schemas[targetSchemaName] = .object(targetSchema)
                }
        }
    }

    /// A wrapper for schemas to ease decoding
    public struct Components: Decodable {
        /// A list of schema names and their representation
        public var schemas: [String: Schema]
    }
}

private extension SubSchema {
    /// Match the sub schema as an Attributes schema and return it if it is
    var asAttributes: ObjectSchema? {
        guard case .attributes(let attributesSchema) = self else { return nil }
        return attributesSchema
    }
}

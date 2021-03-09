import Foundation

public struct ObjectSchema: Decodable, Equatable {
    public let name: String
    public let documentation: Schema.Documentation?
    public let properties: [String: PropertyType]
    public let requiredProperties: [String]
    public let subSchemas: [SubSchema]
    public let kind: Kind

    enum CodingKeys: String, CodingKey {
        case type
        case title
        case properties
        case required
        case attributes
        case relationships
    }

    public enum Kind: Equatable {
        case plain
        case relationshipSubSchema
        case updateRequestData
        case updateResponseData
    }

    internal init(name: String, documentation: Schema.Documentation? = nil, properties: [String: PropertyType] = [:], requiredProperties: [String] = [], subSchemas: [SubSchema] = [], kind: Kind = .plain) {
        self.name = name
        self.documentation = documentation
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.subSchemas = subSchemas.sorted(by: { $0.name < $1.name })
        self.kind = kind
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let requiredProperties = try container.decodeIfPresent([String].self, forKey: .required) ?? []
        let propertiesContainer = try container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: .properties)
        var subSchemas = [SubSchema]()
        let properties = try propertiesContainer.allKeys.reduce(into: [String: PropertyType]()) { properties, key in
            guard key.stringValue != CodingKeys.attributes.stringValue,
                  key.stringValue != CodingKeys.relationships.stringValue else { return }
            guard let propertyType = try? propertiesContainer.decode(PropertyType.self, forKey: key) else {
                throw DecodingError.dataCorruptedError(forKey: key, in: propertiesContainer, debugDescription: "Property type not known")
            }
            switch propertyType {
            case .arrayOfSubSchema(let schema), .schema(let schema):
                subSchemas.append(.objectSchema(schema))
            case .arrayOfOneOf(let name, let schema), .oneOf(let name, let schema):
                subSchemas.append(.oneOf(name: name, schema: schema))
            case .enumSchema(let schema):
                subSchemas.append(.enumSchema(schema))
            default: break
            }
            properties[key.stringValue] = propertyType
        }
        let name: String
        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            name = title
        } else {
            name = container.codingPath.last { $0.stringValue != "items" }!.stringValue.capitalizingFirstLetter()
        }
        let codingPathComponents = Array(container.codingPath
            .map(\.stringValue)
            .drop { $0 == "components" || $0 == "schemas" }
        )
        let documentation: Schema.Documentation?
        if name == "Relationships" {
            if codingPathComponents[0].hasSuffix("UpdateRequest") {
                documentation = .updateRequestRelationships
            } else {
                documentation = .relationships
            }
        } else {
            documentation = codingPathComponents.reduce(nil) { parent, schemaName -> Schema.Documentation? in
                if parent == nil {
                    return Schema.Documentation.allDocumentation[schemaName]
                } else {
                    let findDocumentationForChildren: ([Schema.Documentation]?) -> Schema.Documentation? = { children in
                        if name == "Attributes", let attributesDocumentation = children?.first(where: {
                            guard case .attributes = $0 else { return false }
                            return true
                        }) {
                            return attributesDocumentation
                        } else {
                            let childDocumentation = children?.first {
                                guard case .subObject(let name, _, _, _) = $0 else { return false }
                                return name == schemaName.capitalizingFirstLetter()
                            }
                            return childDocumentation
                        }
                    }
                    if case .object(_, _, let possibleChildren) = parent, let children = possibleChildren {
                        return findDocumentationForChildren(children)
                    } else if case .subObject(_, _, _, let possibleChildren) = parent, let children = possibleChildren {
                        return findDocumentationForChildren(children)
                    }
                    return parent
                }
            }
        }
        let attributes = try propertiesContainer.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "attributes")!)
        if let attributes = attributes, attributes.properties.count > 0 {
            subSchemas.append(.attributes(attributes))
        }
        if let relationships = try propertiesContainer.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "relationships")!),
           relationships.properties.count > 0
        {
            subSchemas.append(.relationships(relationships))
        }
        let kind: Kind
        if name == "Data", codingPathComponents[0].hasSuffix("UpdateRequest") {
            kind = .updateRequestData
        } else if codingPathComponents.contains("relationships") {
            kind = .relationshipSubSchema
        } else {
            kind = .plain
        }
        self.init(name: name, documentation: documentation, properties: properties, requiredProperties: requiredProperties, subSchemas: subSchemas, kind: kind)
    }

    public static func == (lhs: ObjectSchema, rhs: ObjectSchema) -> Bool {
        return lhs.name == rhs.name
            && lhs.properties == rhs.properties
            && lhs.requiredProperties == rhs.requiredProperties
            && lhs.subSchemas == rhs.subSchemas
    }
}

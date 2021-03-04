import Foundation

public struct ObjectSchema: Decodable, Equatable {
    public let name: String
    public let documentation: SchemaDocumentation?
    public let properties: [String: PropertyType]
    public let requiredProperties: [String]
    public let subSchemas: [SubSchema]
    public let isRelationshipSubSchema: Bool

    enum CodingKeys: String, CodingKey {
        case type
        case title
        case properties
        case required
        case attributes
        case relationships
    }

    internal init(name: String, documentation: SchemaDocumentation? = nil, properties: [String: PropertyType] = [:], requiredProperties: [String] = [], subSchemas: [SubSchema] = [], isRelationshipSubSchema: Bool = false) {
        self.name = name
        self.documentation = documentation
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.subSchemas = subSchemas.sorted(by: { $0.name < $1.name })
        self.isRelationshipSubSchema = isRelationshipSubSchema
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
        var documentation: SchemaDocumentation?
        let codingPathComponents = Array(container.codingPath
            .drop { $0.stringValue == "components" || $0.stringValue == "schemas" }
            .map(\.stringValue))
        if codingPathComponents.count < 3,
           let mainSchemaName = codingPathComponents.first,
           let objectDocumentation = Schema.ObjectDocumentation.allDocumentation[mainSchemaName]
        {
            if name == "Attributes" {
                documentation = objectDocumentation.attributes
            } else if name == "Relationships" {
                documentation = Schema.RelationshipDocumentation()
            } else {
                documentation = objectDocumentation
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
        let isRelationshipSubSchema = codingPathComponents.contains("relationships")
        self.init(name: name, documentation: documentation, properties: properties, requiredProperties: requiredProperties, subSchemas: subSchemas, isRelationshipSubSchema: isRelationshipSubSchema)
    }

    public static func == (lhs: ObjectSchema, rhs: ObjectSchema) -> Bool {
        return lhs.name == rhs.name
            && lhs.properties == rhs.properties
            && lhs.requiredProperties == rhs.requiredProperties
            && lhs.subSchemas == rhs.subSchemas
    }
}

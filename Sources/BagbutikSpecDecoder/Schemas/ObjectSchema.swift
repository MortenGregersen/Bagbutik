import Foundation

/// A representation of an object
public struct ObjectSchema: Decodable, Equatable {
    /// The name of the object
    public private(set) var name: String
    /// An url for the documentation for the object
    public let url: String
    /// The properties for the obejct
    public var properties: [String: Property]
    /// A list of properties that is required (always available)
    public var requiredProperties: [String]
    /// A list of schemas derived from the properties and special sub schemas
    public var subSchemas: [SubSchema] {
        var subSchemas = [SubSchema]()
        subSchemas.append(contentsOf: properties.compactMap { _, property in
            switch property.type {
            case .arrayOfSubSchema(let schema), .schema(let schema):
                return .objectSchema(schema)
            case .arrayOfOneOf(let name, let schema), .oneOf(let name, let schema):
                return .oneOf(name: name, schema: schema)
            case .enumSchema(let schema):
                return .enumSchema(schema)
            default:
                return nil
            }
        })
        return subSchemas.sorted(by: { $0.name < $1.name })
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case title
        case properties
        case deprecated
        case required
    }

    private enum PropertyCodingKeys: String, CodingKey {
        case deprecated
    }

    internal init(name: String, url: String, properties: [String: Property] = [:], requiredProperties: [String] = []) {
        self.name = name
        self.url = url
        self.properties = properties
        self.requiredProperties = requiredProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties: [String: Property]
        let propertiesContainer = try? container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: .properties)
        properties = try propertiesContainer?.allKeys.reduce(into: [String: Property]()) { properties, key in
            guard let propertiesContainer = propertiesContainer else { return }
            guard var propertyType = try? propertiesContainer.decode(PropertyType.self, forKey: key) else {
                throw DecodingError.dataCorruptedError(forKey: key, in: propertiesContainer, debugDescription: "Property type not known")
            }
            let propertyContainer = try propertiesContainer.nestedContainer(keyedBy: PropertyCodingKeys.self, forKey: key)
            let deprecated = try propertyContainer.decodeIfPresent(Bool.self, forKey: .deprecated) ?? false
            if key.stringValue == "data", case .arrayOfSubSchema(var subSchema) = propertyType, subSchema.name == "Items" {
                subSchema.name = "Item"
                propertyType = .arrayOfSubSchema(subSchema)
            }
            properties[key.stringValue] = .init(type: propertyType, deprecated: deprecated)
        } ?? [:]
        let name: String
        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            name = title
        } else {
            if container.codingPath.count > 2, container.codingPath[2].stringValue == "ReviewSubmission" {
                name = container.codingPath.last!.stringValue.capitalizingFirstLetter()
            } else {
                name = container.codingPath.last { $0.stringValue != "items" }!.stringValue.capitalizingFirstLetter()
            }
        }
        let requiredProperties: [String] = try container.decodeIfPresent([String].self, forKey: .required) ?? []
        let codingPathComponents = container.codingPath.components
        let url = createDocumentationUrl(forSchemaNamed: name, withCodingPathComponents: codingPathComponents)
        self.init(name: name, url: url, properties: properties, requiredProperties: requiredProperties)
    }
}

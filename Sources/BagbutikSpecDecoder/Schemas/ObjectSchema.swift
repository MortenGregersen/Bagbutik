import Foundation

public struct ObjectSchema: Decodable, Equatable {
    public let name: String
    public let url: String
    public let documentation: Schema.Documentation?
    public let properties: [String: PropertyType]
    public let requiredProperties: [String]
    public let subSchemas: [SubSchema]

    enum CodingKeys: String, CodingKey {
        case type
        case title
        case properties
        case required
        case attributes
        case relationships
    }

    internal init(name: String, url: String, documentation: Schema.Documentation? = nil, properties: [String: PropertyType] = [:], requiredProperties: [String] = [], subSchemas: [SubSchema] = []) {
        self.name = name
        self.url = url
        self.documentation = documentation
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.subSchemas = subSchemas.sorted(by: { $0.name < $1.name })
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
            .map { $0.capitalizingFirstLetter() }
        )
        var urlPathComponents = codingPathComponents
            .filter { $0 != "Items" &&
                $0 != "Source" &&
                $0 != "OneOf" &&
                !$0.hasPrefix("Index ")
            }

        if urlPathComponents.last != name {
            urlPathComponents.append(name.lowercased())
        }
        let uri = urlPathComponents
            .map { $0.lowercased() }
            .joined(separator: "/")
        let url = "https://developer.apple.com/documentation/appstoreconnectapi/\(uri)"
        let documentation = Self.getDocumentation(forSchemaNamed: name, codingPathComponents: codingPathComponents)
        let attributes = try propertiesContainer.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "attributes")!)
        if let attributes = attributes, attributes.properties.count > 0 {
            subSchemas.append(.attributes(attributes))
        }
        if let relationships = try propertiesContainer.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "relationships")!),
           relationships.properties.count > 0
        {
            subSchemas.append(.relationships(relationships))
        }
        self.init(name: name, url: url, documentation: documentation, properties: properties, requiredProperties: requiredProperties, subSchemas: subSchemas)
    }

    private static func getDocumentation(forSchemaNamed name: String, codingPathComponents: [String]) -> Schema.Documentation? {
        let relationshipsName = "Relationships"
        let attributesName = "Attributes"
        let dataName = "Data"
        let linksName = "Links"
        let rootSchemaDocumentation = Schema.Documentation.allDocumentation[codingPathComponents[0]]
        if codingPathComponents.count == 1 {
            return rootSchemaDocumentation
        } else if case .rootSchema(_, _, _, let possibleAttributes) = rootSchemaDocumentation,
                  let attributes = possibleAttributes,
                  codingPathComponents.count == 2, name == attributesName
        {
            return .attributes(attributes)
        } else if codingPathComponents.count >= 2, codingPathComponents[1] == relationshipsName {
            if codingPathComponents.count == 2 {
                return .relationships
            } else if codingPathComponents.count == 3 {
                return .relationship
            } else if codingPathComponents.count >= 4 {
                if name == dataName {
                    return .relationshipData
                } else if name == linksName {
                    return .relationshipLinks
                }
            }
        } else if codingPathComponents[0].hasSuffix("Request") {
            let isUpdateRequest = codingPathComponents[0].hasSuffix("UpdateRequest")
            if codingPathComponents[0].hasSuffix("LinkagesRequest"), name == dataName {
                return .linkagesRequestData
            } else if codingPathComponents.count == 2, name == dataName {
                return isUpdateRequest ? .updateRequestData : .createRequestData
            } else if case .createRequest(_, let possibleAttributes) = rootSchemaDocumentation,
                      let attributes = possibleAttributes,
                      codingPathComponents.count == 3, name == attributesName
            {
                return .createRequestDataAttributes(attributes)
            } else if case .updateRequest(_, let possibleAttributes) = rootSchemaDocumentation,
                      let attributes = possibleAttributes,
                      codingPathComponents.count == 3, name == attributesName
            {
                return .updateRequestDataAttributes(attributes)
            } else if name == relationshipsName {
                return isUpdateRequest ? .updateRequestDataRelationships : .updateRequestDataRelationships
            } else if codingPathComponents.count >= 4, codingPathComponents[3] == name {
                return isUpdateRequest ? .updateRequestDataRelationship : .createRequestDataRelationship
            } else if codingPathComponents.count >= 5, name == dataName {
                return isUpdateRequest ? .updateRequestDataRelationshipData : .createRequestDataRelationshipData
            }
        } else if codingPathComponents[0].hasSuffix("LinkagesResponse"), name == dataName {
            return .linkagesResponseData
        } else if codingPathComponents[0] == "ErrorResponse" {
            var pathComponents = codingPathComponents
                .filter { $0 != "Items" &&
                    $0 != "Source" &&
                    $0 != "OneOf" &&
                    !$0.hasPrefix("Index ")
                }
            if pathComponents.last != name {
                pathComponents.append(name)
            }
            return Schema.Documentation.allDocumentation[pathComponents.joined(separator: ".")]
        } else if codingPathComponents[0] == "PagingInformation" {
            return Schema.Documentation.allDocumentation[codingPathComponents.joined(separator: ".")]
        }
        return nil
    }
}

import Foundation

/// A representation of an object
public struct ObjectSchema: Decodable, Equatable {
    /// The name of the object
    public let name: String
    /// An url for the documentation for the object
    public let url: String
    /// The documentation for the obejct - if any
    public let documentation: Schema.Documentation?
    /// The properties for the obejct
    public var properties: [String: Property]
    /// A list of properties that is required (always available)
    public let requiredProperties: [String]
    /// A list of schemas derived from the properties and special sub schemas
    public var subSchemas: [SubSchema] {
        var subSchemas = [SubSchema]()
        subSchemas.append(contentsOf: [attributesSchema, relationshipsSchema].compactMap { $0 })
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

    /// A schema for Attributes
    public var attributesSchema: SubSchema?
    /// A schema for Relationships
    public var relationshipsSchema: SubSchema?

    private enum CodingKeys: String, CodingKey {
        case type
        case title
        case properties
        case deprecated
        case required
        case attributes
        case relationships
    }

    private enum PropertyCodingKeys: String, CodingKey {
        case deprecated
    }

    internal init(name: String, url: String, documentation: Schema.Documentation? = nil, properties: [String: Property] = [:], requiredProperties: [String] = [], attributesSchema: SubSchema? = nil, relationshipsSchema: SubSchema? = nil) {
        self.name = name
        self.url = url
        self.documentation = documentation
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.attributesSchema = attributesSchema
        self.relationshipsSchema = relationshipsSchema
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties: [String: Property]
        let propertiesContainer = try? container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: .properties)
        properties = try propertiesContainer?.allKeys.reduce(into: [String: Property]()) { properties, key in
            guard let propertiesContainer = propertiesContainer else { return }
            guard key.stringValue != CodingKeys.attributes.stringValue,
                  key.stringValue != CodingKeys.relationships.stringValue else { return }
            guard let propertyType = try? propertiesContainer.decode(PropertyType.self, forKey: key) else {
                throw DecodingError.dataCorruptedError(forKey: key, in: propertiesContainer, debugDescription: "Property type not known")
            }
            let propertyContainer = try propertiesContainer.nestedContainer(keyedBy: PropertyCodingKeys.self, forKey: key)
            let deprecated = try propertyContainer.decodeIfPresent(Bool.self, forKey: .deprecated) ?? false
            properties[key.stringValue] = .init(type: propertyType, deprecated: deprecated)
        } ?? [:]
        let name: String
        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            name = title
        } else {
            name = container.codingPath.last { $0.stringValue != "items" }!.stringValue.capitalizingFirstLetter()
        }
        let requiredProperties: [String] = try {
            var decodedRequiredProperties = try container.decodeIfPresent([String].self, forKey: .required) ?? []
            if name == "BuildBundle" {
                // HACK: In Apple's OpenAPI spec the `links` property on `BuildBundle` is marked as `required.
                // But when requesting build bunldes from the API, the `links` property is missing in the response.
                // Reported to Apple 27/5/22 as FB10029609.
                decodedRequiredProperties.removeAll(where: { $0 == "links" })
            }
            return decodedRequiredProperties
        }()
        let codingPathComponents = container.codingPath.components
        let url = createDocumentationUrl(forSchemaNamed: name, withCodingPathComponents: codingPathComponents)
        let documentation = Self.getDocumentation(forSchemaNamed: name, codingPathComponents: codingPathComponents)
        var attributesSchema, relationshipsSchema: SubSchema?
        let attributes = try? propertiesContainer?.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "attributes")!)
        if let attributes = attributes, attributes.properties.count > 0 {
            attributesSchema = .attributes(attributes)
        }
        if let relationships = try? propertiesContainer?.decodeIfPresent(ObjectSchema.self, forKey: DynamicCodingKeys(stringValue: "relationships")!),
           relationships.properties.count > 0 {
            relationshipsSchema = .relationships(relationships)
        }
        self.init(name: name, url: url, documentation: documentation, properties: properties, requiredProperties: requiredProperties, attributesSchema: attributesSchema, relationshipsSchema: relationshipsSchema)
    }

    internal static func getDocumentation(forSchemaNamed name: String,
                                          codingPathComponents: [String],
                                          lookupDocumentation: (String) -> Schema.Documentation?
                                              = Schema.Documentation.lookupDocumentation(forSchemaNamed:))
        -> Schema.Documentation?
    {
        let relationshipsName = "Relationships"
        let attributesName = "Attributes"
        let dataName = "Data"
        let linksName = "Links"
        let rootSchemaDocumentation = lookupDocumentation(codingPathComponents[0])
        if codingPathComponents.count == 1 {
            return rootSchemaDocumentation
        } else if case .rootSchema(_, _, _, let possibleAttributes) = rootSchemaDocumentation,
                  let attributes = possibleAttributes,
                  codingPathComponents.count == 2, name == attributesName {
            return .attributes(attributes)
        } else if codingPathComponents.count >= 2, codingPathComponents[1] == relationshipsName {
            if codingPathComponents.count == 2 {
                return .relationships
            } else if codingPathComponents.count == 3 {
                return .relationship
            } else {
                if name == dataName {
                    return .relationshipData
                } else if name == linksName {
                    return .relationshipLinks
                }
            }
            return nil
        } else if codingPathComponents[0].hasSuffix("Request") {
            let isUpdateRequest = codingPathComponents[0].hasSuffix("UpdateRequest")
            if codingPathComponents[0].hasSuffix("LinkagesRequest"), name == dataName {
                return .linkagesRequestData
            } else if codingPathComponents.count == 2, name == dataName {
                return isUpdateRequest ? .updateRequestData : .createRequestData
            } else if case .createRequest(_, let possibleAttributes) = rootSchemaDocumentation,
                      let attributes = possibleAttributes,
                      codingPathComponents.count == 3, name == attributesName {
                return .createRequestDataAttributes(attributes)
            } else if case .updateRequest(_, let possibleAttributes) = rootSchemaDocumentation,
                      let attributes = possibleAttributes,
                      codingPathComponents.count == 3, name == attributesName {
                return .updateRequestDataAttributes(attributes)
            } else if name == relationshipsName {
                return isUpdateRequest ? .updateRequestDataRelationships : .createRequestDataRelationships
            } else if codingPathComponents.count >= 4, codingPathComponents[3] == name {
                return isUpdateRequest ? .updateRequestDataRelationship : .createRequestDataRelationship
            } else if codingPathComponents.count >= 5, name == dataName {
                return isUpdateRequest ? .updateRequestDataRelationshipData : .createRequestDataRelationshipData
            }
            return nil
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
            return lookupDocumentation(pathComponents.joined(separator: "."))
        } else if codingPathComponents[0] == "PagingInformation" {
            return lookupDocumentation(codingPathComponents.joined(separator: "."))
        }
        return nil
    }
}

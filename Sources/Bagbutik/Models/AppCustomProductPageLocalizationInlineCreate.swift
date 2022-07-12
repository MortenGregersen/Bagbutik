import Foundation

public struct AppCustomProductPageLocalizationInlineCreate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public var id: String?
    /// The resource type.
    public var type: String { "appCustomProductPageLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String? = nil, attributes: Attributes, relationships: Relationships? = nil) {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        attributes = try container.decode(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
        case relationships
    }

    public struct Attributes: Codable {
        public let locale: String
        public var promotionalText: String?

        public init(locale: String, promotionalText: String? = nil) {
            self.locale = locale
            self.promotionalText = promotionalText
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpagelocalizationinlinecreate/relationships>
     */
    public struct Relationships: Codable {
        public var appCustomProductPageVersion: AppCustomProductPageVersion?

        public init(appCustomProductPageVersion: AppCustomProductPageVersion? = nil) {
            self.appCustomProductPageVersion = appCustomProductPageVersion
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpagelocalizationinlinecreate/relationships/appcustomproductpageversion>
         */
        public struct AppCustomProductPageVersion: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpagelocalizationinlinecreate/relationships/appcustomproductpageversion/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCustomProductPageVersions" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }
        }
    }
}

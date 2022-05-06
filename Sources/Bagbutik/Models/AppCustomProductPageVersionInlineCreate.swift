import Foundation

public struct AppCustomProductPageVersionInlineCreate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public var id: String?
    /// The resource type.
    public var type: String { "appCustomProductPageVersions" }
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case relationships
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageversioninlinecreate/relationships>
     */
    public struct Relationships: Codable {
        public var appCustomProductPage: AppCustomProductPage?
        public var appCustomProductPageLocalizations: AppCustomProductPageLocalizations?

        public init(appCustomProductPage: AppCustomProductPage? = nil, appCustomProductPageLocalizations: AppCustomProductPageLocalizations? = nil) {
            self.appCustomProductPage = appCustomProductPage
            self.appCustomProductPageLocalizations = appCustomProductPageLocalizations
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageversioninlinecreate/relationships/appcustomproductpage>
         */
        public struct AppCustomProductPage: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageversioninlinecreate/relationships/appcustomproductpage/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCustomProductPages" }

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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageversioninlinecreate/relationships/appcustomproductpagelocalizations>
         */
        public struct AppCustomProductPageLocalizations: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: [Data]?

            public init(data: [Data]? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageversioninlinecreate/relationships/appcustomproductpagelocalizations/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCustomProductPageLocalizations" }

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

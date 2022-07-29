import Foundation

/**
 # AppPreOrder
 The data structure that represent an App Pre Orders resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder>
 */
public struct AppPreOrder: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "appPreOrders" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # AppPreOrder.Attributes
     Attributes that describe an App Pre Orders resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder/attributes>
     */
    public struct Attributes: Codable {
        public var appReleaseDate: String?
        public var preOrderAvailableDate: String?

        public init(appReleaseDate: String? = nil,
                    preOrderAvailableDate: String? = nil)
        {
            self.appReleaseDate = appReleaseDate
            self.preOrderAvailableDate = preOrderAvailableDate
        }
    }

    /**
     # AppPreOrder.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder/relationships>
     */
    public struct Relationships: Codable {
        public var app: App?

        public init(app: App? = nil) {
            self.app = app
        }

        /**
         # AppPreOrder.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder/relationships/app>
         */
        public struct App: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            /**
             # AppPreOrder.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder/relationships/app/data>
             */
            public struct Data: Codable {
                public let id: String
                public var type: String { "apps" }

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

            /**
             # AppPreOrder.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreorder/relationships/app/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}

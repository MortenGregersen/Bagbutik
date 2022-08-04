import Foundation

/**
 # AppPriceTier
 The data structure that represent an App Price Tiers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricetier>
 */
public struct AppPriceTier: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appPriceTiers" }
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
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
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case relationships
        case type
    }

    /**
     # AppPriceTier.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppricetier/relationships>
     */
    public struct Relationships: Codable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var pricePoints: PricePoints? = nil

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(pricePoints: PricePoints? = nil) {
            self.pricePoints = pricePoints
        }

        public init() {}

        /**
         # AppPriceTier.Relationships.PricePoints
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppricetier/relationships/pricepoints>
         */
        public struct PricePoints: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             # AppPriceTier.Relationships.PricePoints.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppricetier/relationships/pricepoints/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appPricePoints" }

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
             # AppPriceTier.Relationships.PricePoints.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppricetier/relationships/pricepoints/links>
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

import Bagbutik_Core
import Foundation

/**
 # CustomerReview
 The data structure that represents a Customer Reviews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreview>
 */
public struct CustomerReview: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the `CustomerReviews` resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "customerReviews" }
    /// The attributes of the customer’s review including its content.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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
     # CustomerReview.Attributes
     The attributes of the customer’s review including its content.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/attributes>
     */
    public struct Attributes: Codable {
        /// The review text that the customer wrote.
        public var body: String?
        /// The date and time the customer created the review.
        public var createdDate: Date?
        /// The rating the customer provided.
        public var rating: Int?
        /// The customer’s nickname used in the review.
        public var reviewerNickname: String?
        /// The App Store territory.
        public var territory: TerritoryCode?
        /// The title that the customer wrote for the review.
        public var title: String?

        public init(body: String? = nil,
                    createdDate: Date? = nil,
                    rating: Int? = nil,
                    reviewerNickname: String? = nil,
                    territory: TerritoryCode? = nil,
                    title: String? = nil)
        {
            self.body = body
            self.createdDate = createdDate
            self.rating = rating
            self.reviewerNickname = reviewerNickname
            self.territory = territory
            self.title = title
        }
    }

    /**
     # CustomerReview.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships>
     */
    public struct Relationships: Codable {
        /// The data and links that describe the relationship between the `CustomerReviews` and `CustomerReviewResponses` resources.
        public var response: Response?

        public init(response: Response? = nil) {
            self.response = response
        }

        /**
         # CustomerReview.Relationships.Response
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response>
         */
        public struct Response: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?
            /// The links to the related data and the relationship’s self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            /**
             # CustomerReview.Relationships.Response.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "customerReviewResponses" }

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
             # CustomerReview.Relationships.Response.Links
             The links to the related data and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public var related: String?
                /// The relashionship’s self-link.
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

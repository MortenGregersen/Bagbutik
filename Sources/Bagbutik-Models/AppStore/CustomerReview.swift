import Bagbutik_Core
import Foundation

/**
 # CustomerReview
 The data structure that represents a Customer Reviews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreview>
 */
public struct CustomerReview: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the `CustomerReviews` resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "customerReviews" }
    /// The attributes of the customer’s review including its content.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # CustomerReview.Attributes
     The attributes of the customer’s review including its content.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/attributes>
     */
    public struct Attributes: Codable, Sendable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            body = try container.decodeIfPresent(String.self, forKey: "body")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            rating = try container.decodeIfPresent(Int.self, forKey: "rating")
            reviewerNickname = try container.decodeIfPresent(String.self, forKey: "reviewerNickname")
            territory = try container.decodeIfPresent(TerritoryCode.self, forKey: "territory")
            title = try container.decodeIfPresent(String.self, forKey: "title")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(body, forKey: "body")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(rating, forKey: "rating")
            try container.encodeIfPresent(reviewerNickname, forKey: "reviewerNickname")
            try container.encodeIfPresent(territory, forKey: "territory")
            try container.encodeIfPresent(title, forKey: "title")
        }
    }

    /**
     # CustomerReview.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The data and links that describe the relationship between the `CustomerReviews` and `CustomerReviewResponses` resources.
        public var response: Response?

        public init(response: Response? = nil) {
            self.response = response
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            response = try container.decodeIfPresent(Response.self, forKey: "response")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(response, forKey: "response")
        }

        /**
         # CustomerReview.Relationships.Response
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response>
         */
        public struct Response: Codable, Sendable {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CustomerReview.Relationships.Response.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "customerReviewResponses" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }

            /**
             # CustomerReview.Relationships.Response.Links
             The links to the related data and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreview/relationships/response/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}

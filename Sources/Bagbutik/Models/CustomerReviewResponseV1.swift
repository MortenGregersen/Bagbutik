import Foundation

/**
 # CustomerReviewResponseV1
 The data structure that represents the Customer Review Responses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1>
 */
public struct CustomerReviewResponseV1: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the `CustomerReviewResponses` resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "customerReviewResponses" }
    /// The attributes of the response to the customer’s review, including its content.
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
     # CustomerReviewResponseV1.Attributes
     The attributes of the response to a customer’s review including its content.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1/attributes>
     */
    public struct Attributes: Codable {
        /// The date and time you last modified your response to the customer’s review.
        public var lastModifiedDate: Date?
        /// The text of the response that you wrote to the customer’s review.
        public var responseBody: String?
        /// The state of your response.
        public var state: State?

        public init(lastModifiedDate: Date? = nil,
                    responseBody: String? = nil,
                    state: State? = nil)
        {
            self.lastModifiedDate = lastModifiedDate
            self.responseBody = responseBody
            self.state = state
        }

        public enum State: String, Codable, CaseIterable {
            case published = "PUBLISHED"
            case pendingPublish = "PENDING_PUBLISH"
        }
    }

    /**
     # CustomerReviewResponseV1.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1/relationships>
     */
    public struct Relationships: Codable {
        /// The customer review related to your response.
        public var review: Review?

        public init(review: Review? = nil) {
            self.review = review
        }

        /**
         # CustomerReviewResponseV1.Relationships.Review
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1/relationships/review>
         */
        public struct Review: Codable {
            /// The type and ID of a resource that you’re relating with the resource you’re updating.
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
             # CustomerReviewResponseV1.Relationships.Review.Data
             The type and ID of a resource that you’re relating with the resource you’re updating.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1/relationships/review/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the `customerReviews` resource.
                public let id: String
                /// The resource type.
                public var type: String { "customerReviews" }

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
             # CustomerReviewResponseV1.Relationships.Review.Links
             The links to the related data and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1/relationships/review/links>
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

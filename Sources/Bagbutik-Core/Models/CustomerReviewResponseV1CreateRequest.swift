import Foundation

/**
 # CustomerReviewResponseV1CreateRequest
 The request body to use to create a response to a customer review.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest>
 */
public struct CustomerReviewResponseV1CreateRequest: Codable, RequestBody {
    /// The resource data for your customer review response.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # CustomerReviewResponseV1CreateRequest.Data
     The data element of the request body for creating a response to a customer review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "customerReviewResponses" }
        /// The attributes of the customer review response, including its text content.
        public let attributes: Attributes
        /// Navigational links to related data and included resource types and IDs.
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # CustomerReviewResponseV1CreateRequest.Data.Attributes
         The attributes of the customer review response, including its text content.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The text of your response to the customer review.
            public let responseBody: String

            public init(responseBody: String) {
                self.responseBody = responseBody
            }
        }

        /**
         # CustomerReviewResponseV1CreateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The customer review related to the response you’re creating.
            public let review: Review

            public init(review: Review) {
                self.review = review
            }

            /**
             # CustomerReviewResponseV1CreateRequest.Data.Relationships.Review
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest/data/relationships/review>
             */
            public struct Review: Codable {
                /// The type and ID of a resource that you’re relating with the resource you’re updating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # CustomerReviewResponseV1CreateRequest.Data.Relationships.Review.Data
                 The type and ID of a resource that you’re relating with the resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1createrequest/data/relationships/review/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the `customerReviews` resource that you’re responding to.
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
            }
        }
    }
}

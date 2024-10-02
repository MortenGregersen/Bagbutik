import Bagbutik_Core
import Foundation

public struct CustomerReviewResponseV1: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "customerReviewResponses" }
    public var attributes: Attributes?
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

    public struct Attributes: Codable, Sendable {
        public var lastModifiedDate: Date?
        public var responseBody: String?
        public var state: State?

        public init(lastModifiedDate: Date? = nil,
                    responseBody: String? = nil,
                    state: State? = nil)
        {
            self.lastModifiedDate = lastModifiedDate
            self.responseBody = responseBody
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
            responseBody = try container.decodeIfPresent(String.self, forKey: "responseBody")
            state = try container.decodeIfPresent(State.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
            try container.encodeIfPresent(responseBody, forKey: "responseBody")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case pendingPublish = "PENDING_PUBLISH"
            case published = "PUBLISHED"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var review: Review?

        public init(review: Review? = nil) {
            self.review = review
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            review = try container.decodeIfPresent(Review.self, forKey: "review")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(review, forKey: "review")
        }

        public struct Review: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "customerReviews" }

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
        }
    }
}

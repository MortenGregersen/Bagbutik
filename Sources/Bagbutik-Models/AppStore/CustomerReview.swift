import Bagbutik_Core
import Foundation

public struct CustomerReview: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "customerReviews" }
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
        public var body: String?
        public var createdDate: Date?
        public var rating: Int?
        public var reviewerNickname: String?
        public var territory: TerritoryCode?
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

    public struct Relationships: Codable, Sendable {
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

        public struct Response: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
        }
    }
}

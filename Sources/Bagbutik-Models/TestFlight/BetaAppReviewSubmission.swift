import Bagbutik_Core
import Foundation

public struct BetaAppReviewSubmission: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "betaAppReviewSubmissions" }
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
        public var betaReviewState: BetaReviewState?
        public var submittedDate: Date?

        public init(betaReviewState: BetaReviewState? = nil,
                    submittedDate: Date? = nil)
        {
            self.betaReviewState = betaReviewState
            self.submittedDate = submittedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            betaReviewState = try container.decodeIfPresent(BetaReviewState.self, forKey: "betaReviewState")
            submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(betaReviewState, forKey: "betaReviewState")
            try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var build: Build?

        public init(build: Build? = nil) {
            self.build = build
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            build = try container.decodeIfPresent(Build.self, forKey: "build")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(build, forKey: "build")
        }

        public struct Build: Codable, Sendable {
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
                public var type: String { "builds" }

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

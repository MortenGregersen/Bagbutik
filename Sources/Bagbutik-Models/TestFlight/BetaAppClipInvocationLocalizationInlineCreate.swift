import Bagbutik_Core
import Foundation

public struct BetaAppClipInvocationLocalizationInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "betaAppClipInvocationLocalizations" }
    public let attributes: Attributes
    public var relationships: Relationships?

    public init(id: String? = nil,
                attributes: Attributes,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decode(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encode(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public let locale: String
        public let title: String

        public init(locale: String,
                    title: String)
        {
            self.locale = locale
            self.title = title
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decode(String.self, forKey: "locale")
            title = try container.decode(String.self, forKey: "title")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(locale, forKey: "locale")
            try container.encode(title, forKey: "title")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var betaAppClipInvocation: BetaAppClipInvocation?

        public init(betaAppClipInvocation: BetaAppClipInvocation? = nil) {
            self.betaAppClipInvocation = betaAppClipInvocation
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            betaAppClipInvocation = try container.decodeIfPresent(BetaAppClipInvocation.self, forKey: "betaAppClipInvocation")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(betaAppClipInvocation, forKey: "betaAppClipInvocation")
        }

        public struct BetaAppClipInvocation: Codable, Sendable {
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
                public var type: String { "betaAppClipInvocations" }

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

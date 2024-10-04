import Bagbutik_Core
import Foundation

/**
 # BetaAppLocalization
 The data structure that represents a Beta App Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization>
 */
public struct BetaAppLocalization: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaAppLocalizations" }
    /// The resource’s attributes.
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

    public struct Attributes: Codable, Sendable {
        public var description: String?
        public var feedbackEmail: String?
        public var locale: String?
        public var marketingUrl: String?
        public var privacyPolicyUrl: String?
        public var tvOsPrivacyPolicy: String?

        public init(description: String? = nil,
                    feedbackEmail: String? = nil,
                    locale: String? = nil,
                    marketingUrl: String? = nil,
                    privacyPolicyUrl: String? = nil,
                    tvOsPrivacyPolicy: String? = nil)
        {
            self.description = description
            self.feedbackEmail = feedbackEmail
            self.locale = locale
            self.marketingUrl = marketingUrl
            self.privacyPolicyUrl = privacyPolicyUrl
            self.tvOsPrivacyPolicy = tvOsPrivacyPolicy
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            description = try container.decodeIfPresent(String.self, forKey: "description")
            feedbackEmail = try container.decodeIfPresent(String.self, forKey: "feedbackEmail")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
            privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
            tvOsPrivacyPolicy = try container.decodeIfPresent(String.self, forKey: "tvOsPrivacyPolicy")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(feedbackEmail, forKey: "feedbackEmail")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
            try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
            try container.encodeIfPresent(tvOsPrivacyPolicy, forKey: "tvOsPrivacyPolicy")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var app: App?

        public init(app: App? = nil) {
            self.app = app
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
        }

        public struct App: Codable, Sendable {
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
                public var type: String { "apps" }

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

import Bagbutik_Core
import Foundation

public struct SubscriptionGroupLocalization: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionGroupLocalizations" }
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

    public struct Attributes: Codable {
        public var customAppName: String?
        public var locale: String?
        public var name: String?
        public var state: State?

        public init(customAppName: String? = nil,
                    locale: String? = nil,
                    name: String? = nil,
                    state: State? = nil)
        {
            self.customAppName = customAppName
            self.locale = locale
            self.name = name
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            customAppName = try container.decodeIfPresent(String.self, forKey: "customAppName")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            state = try container.decodeIfPresent(State.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(customAppName, forKey: "customAppName")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public enum State: String, Codable, CaseIterable {
            case approved = "APPROVED"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case rejected = "REJECTED"
            case waitingForReview = "WAITING_FOR_REVIEW"
        }
    }

    public struct Relationships: Codable {
        public var subscriptionGroup: SubscriptionGroup?

        public init(subscriptionGroup: SubscriptionGroup? = nil) {
            self.subscriptionGroup = subscriptionGroup
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            subscriptionGroup = try container.decodeIfPresent(SubscriptionGroup.self, forKey: "subscriptionGroup")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(subscriptionGroup, forKey: "subscriptionGroup")
        }

        public struct SubscriptionGroup: Codable {
            @NullCodable public var data: Data?
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

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "subscriptionGroups" }

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

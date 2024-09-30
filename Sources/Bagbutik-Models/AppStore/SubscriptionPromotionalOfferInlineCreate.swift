import Bagbutik_Core
import Foundation

public struct SubscriptionPromotionalOfferInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "subscriptionPromotionalOffers" }
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
        public let duration: SubscriptionOfferDuration
        public let name: String
        public let numberOfPeriods: Int
        public let offerCode: String
        public let offerMode: SubscriptionOfferMode

        public init(duration: SubscriptionOfferDuration,
                    name: String,
                    numberOfPeriods: Int,
                    offerCode: String,
                    offerMode: SubscriptionOfferMode)
        {
            self.duration = duration
            self.name = name
            self.numberOfPeriods = numberOfPeriods
            self.offerCode = offerCode
            self.offerMode = offerMode
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            duration = try container.decode(SubscriptionOfferDuration.self, forKey: "duration")
            name = try container.decode(String.self, forKey: "name")
            numberOfPeriods = try container.decode(Int.self, forKey: "numberOfPeriods")
            offerCode = try container.decode(String.self, forKey: "offerCode")
            offerMode = try container.decode(SubscriptionOfferMode.self, forKey: "offerMode")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(duration, forKey: "duration")
            try container.encode(name, forKey: "name")
            try container.encode(numberOfPeriods, forKey: "numberOfPeriods")
            try container.encode(offerCode, forKey: "offerCode")
            try container.encode(offerMode, forKey: "offerMode")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var prices: Prices?
        public var subscription: Subscription?

        public init(prices: Prices? = nil,
                    subscription: Subscription? = nil)
        {
            self.prices = prices
            self.subscription = subscription
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            prices = try container.decodeIfPresent(Prices.self, forKey: "prices")
            subscription = try container.decodeIfPresent(Subscription.self, forKey: "subscription")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(prices, forKey: "prices")
            try container.encodeIfPresent(subscription, forKey: "subscription")
        }

        public struct Prices: Codable, Sendable {
            @NullCodable public var data: [Data]?

            public init(data: [Data]? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "subscriptionPromotionalOfferPrices" }

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

        public struct Subscription: Codable, Sendable {
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
                public var type: String { "subscriptions" }

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

import Bagbutik_Core
import Foundation

public struct SubscriptionPromotionalOfferCreateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [SubscriptionPromotionalOfferPriceInlineCreate]?

    public init(data: Data,
                included: [SubscriptionPromotionalOfferPriceInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public struct Data: Codable {
        public var type: String { "subscriptionPromotionalOffers" }
        public let attributes: Attributes
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

        public struct Attributes: Codable {
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
        }

        public struct Relationships: Codable {
            public let prices: Prices
            public let subscription: Subscription

            public init(prices: Prices,
                        subscription: Subscription)
            {
                self.prices = prices
                self.subscription = subscription
            }

            public struct Prices: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "subscriptionPromotionalOfferPrices" }

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

            public struct Subscription: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "subscriptions" }

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

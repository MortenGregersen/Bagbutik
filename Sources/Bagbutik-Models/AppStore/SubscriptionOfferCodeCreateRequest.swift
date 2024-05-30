import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCodeCreateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [SubscriptionOfferCodePriceInlineCreate]?

    public init(data: Data,
                included: [SubscriptionOfferCodePriceInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionOfferCodePriceInlineCreate].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    public struct Data: Codable {
        public var type: String { "subscriptionOfferCodes" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable {
            public let customerEligibilities: [SubscriptionCustomerEligibility]
            public let duration: SubscriptionOfferDuration
            public let name: String
            public let numberOfPeriods: Int
            public let offerEligibility: SubscriptionOfferEligibility
            public let offerMode: SubscriptionOfferMode

            public init(customerEligibilities: [SubscriptionCustomerEligibility],
                        duration: SubscriptionOfferDuration,
                        name: String,
                        numberOfPeriods: Int,
                        offerEligibility: SubscriptionOfferEligibility,
                        offerMode: SubscriptionOfferMode)
            {
                self.customerEligibilities = customerEligibilities
                self.duration = duration
                self.name = name
                self.numberOfPeriods = numberOfPeriods
                self.offerEligibility = offerEligibility
                self.offerMode = offerMode
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                customerEligibilities = try container.decode([SubscriptionCustomerEligibility].self, forKey: "customerEligibilities")
                duration = try container.decode(SubscriptionOfferDuration.self, forKey: "duration")
                name = try container.decode(String.self, forKey: "name")
                numberOfPeriods = try container.decode(Int.self, forKey: "numberOfPeriods")
                offerEligibility = try container.decode(SubscriptionOfferEligibility.self, forKey: "offerEligibility")
                offerMode = try container.decode(SubscriptionOfferMode.self, forKey: "offerMode")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(customerEligibilities, forKey: "customerEligibilities")
                try container.encode(duration, forKey: "duration")
                try container.encode(name, forKey: "name")
                try container.encode(numberOfPeriods, forKey: "numberOfPeriods")
                try container.encode(offerEligibility, forKey: "offerEligibility")
                try container.encode(offerMode, forKey: "offerMode")
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                prices = try container.decode(Prices.self, forKey: "prices")
                subscription = try container.decode(Subscription.self, forKey: "subscription")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(prices, forKey: "prices")
                try container.encode(subscription, forKey: "subscription")
            }

            public struct Prices: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "subscriptionOfferCodePrices" }

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

            public struct Subscription: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Identifiable {
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
}

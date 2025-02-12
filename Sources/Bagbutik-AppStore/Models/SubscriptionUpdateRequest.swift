import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct SubscriptionUpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data
    public var included: [Included]?

    public init(data: Data,
                included: [Included]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "subscriptions" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var familySharable: Bool?
            public var groupLevel: Int?
            public var name: String?
            public var reviewNote: String?
            public var subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod?

            public init(familySharable: Bool? = nil,
                        groupLevel: Int? = nil,
                        name: String? = nil,
                        reviewNote: String? = nil,
                        subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod? = nil)
            {
                self.familySharable = familySharable
                self.groupLevel = groupLevel
                self.name = name
                self.reviewNote = reviewNote
                self.subscriptionPeriod = subscriptionPeriod
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                familySharable = try container.decodeIfPresent(Bool.self, forKey: "familySharable")
                groupLevel = try container.decodeIfPresent(Int.self, forKey: "groupLevel")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                reviewNote = try container.decodeIfPresent(String.self, forKey: "reviewNote")
                subscriptionPeriod = try container.decodeIfPresent(Subscription.Attributes.SubscriptionPeriod.self, forKey: "subscriptionPeriod")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(familySharable, forKey: "familySharable")
                try container.encodeIfPresent(groupLevel, forKey: "groupLevel")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(reviewNote, forKey: "reviewNote")
                try container.encodeIfPresent(subscriptionPeriod, forKey: "subscriptionPeriod")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var introductoryOffers: IntroductoryOffers?
            public var prices: Prices?
            public var promotionalOffers: PromotionalOffers?

            public init(introductoryOffers: IntroductoryOffers? = nil,
                        prices: Prices? = nil,
                        promotionalOffers: PromotionalOffers? = nil)
            {
                self.introductoryOffers = introductoryOffers
                self.prices = prices
                self.promotionalOffers = promotionalOffers
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                introductoryOffers = try container.decodeIfPresent(IntroductoryOffers.self, forKey: "introductoryOffers")
                prices = try container.decodeIfPresent(Prices.self, forKey: "prices")
                promotionalOffers = try container.decodeIfPresent(PromotionalOffers.self, forKey: "promotionalOffers")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(introductoryOffers, forKey: "introductoryOffers")
                try container.encodeIfPresent(prices, forKey: "prices")
                try container.encodeIfPresent(promotionalOffers, forKey: "promotionalOffers")
            }

            public struct IntroductoryOffers: Codable, Sendable {
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
                    public var type: String { "subscriptionIntroductoryOffers" }

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
                    public var type: String { "subscriptionPrices" }

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

            public struct PromotionalOffers: Codable, Sendable {
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
                    public var type: String { "subscriptionPromotionalOffers" }

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

    public enum Included: Codable, Sendable {
        case subscriptionIntroductoryOfferInlineCreate(SubscriptionIntroductoryOfferInlineCreate)
        case subscriptionPriceInlineCreate(SubscriptionPriceInlineCreate)
        case subscriptionPromotionalOfferInlineCreate(SubscriptionPromotionalOfferInlineCreate)

        public init(from decoder: Decoder) throws {
            if let subscriptionIntroductoryOfferInlineCreate = try? SubscriptionIntroductoryOfferInlineCreate(from: decoder) {
                self = .subscriptionIntroductoryOfferInlineCreate(subscriptionIntroductoryOfferInlineCreate)
            } else if let subscriptionPriceInlineCreate = try? SubscriptionPriceInlineCreate(from: decoder) {
                self = .subscriptionPriceInlineCreate(subscriptionPriceInlineCreate)
            } else if let subscriptionPromotionalOfferInlineCreate = try? SubscriptionPromotionalOfferInlineCreate(from: decoder) {
                self = .subscriptionPromotionalOfferInlineCreate(subscriptionPromotionalOfferInlineCreate)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscriptionIntroductoryOfferInlineCreate(value):
                try value.encode(to: encoder)
            case let .subscriptionPriceInlineCreate(value):
                try value.encode(to: encoder)
            case let .subscriptionPromotionalOfferInlineCreate(value):
                try value.encode(to: encoder)
            }
        }
    }
}

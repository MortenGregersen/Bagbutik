import BagbutikCore
import Foundation

public struct RetentionOffer: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "retentionOffers" }
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
        public var customerEligibilityPaidSubscriptionDurationInMonths: Int?
        public var customerEligibilityWaitBetweenOffersInMonths: Int?
        public var duration: SubscriptionOfferDuration?
        public var offerId: String?
        public var offerMode: SubscriptionOfferMode?
        public var periodCount: Int?
        public var referenceName: String?
        public var targetSubscriptionPlanType: SubscriptionPlanType?

        public init(customerEligibilityPaidSubscriptionDurationInMonths: Int? = nil,
                    customerEligibilityWaitBetweenOffersInMonths: Int? = nil,
                    duration: SubscriptionOfferDuration? = nil,
                    offerId: String? = nil,
                    offerMode: SubscriptionOfferMode? = nil,
                    periodCount: Int? = nil,
                    referenceName: String? = nil,
                    targetSubscriptionPlanType: SubscriptionPlanType? = nil)
        {
            self.customerEligibilityPaidSubscriptionDurationInMonths = customerEligibilityPaidSubscriptionDurationInMonths
            self.customerEligibilityWaitBetweenOffersInMonths = customerEligibilityWaitBetweenOffersInMonths
            self.duration = duration
            self.offerId = offerId
            self.offerMode = offerMode
            self.periodCount = periodCount
            self.referenceName = referenceName
            self.targetSubscriptionPlanType = targetSubscriptionPlanType
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            customerEligibilityPaidSubscriptionDurationInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
            customerEligibilityWaitBetweenOffersInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityWaitBetweenOffersInMonths")
            duration = try container.decodeIfPresent(SubscriptionOfferDuration.self, forKey: "duration")
            offerId = try container.decodeIfPresent(String.self, forKey: "offerId")
            offerMode = try container.decodeIfPresent(SubscriptionOfferMode.self, forKey: "offerMode")
            periodCount = try container.decodeIfPresent(Int.self, forKey: "periodCount")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            targetSubscriptionPlanType = try container.decodeIfPresent(SubscriptionPlanType.self, forKey: "targetSubscriptionPlanType")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(customerEligibilityPaidSubscriptionDurationInMonths, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
            try container.encodeIfPresent(customerEligibilityWaitBetweenOffersInMonths, forKey: "customerEligibilityWaitBetweenOffersInMonths")
            try container.encodeIfPresent(duration, forKey: "duration")
            try container.encodeIfPresent(offerId, forKey: "offerId")
            try container.encodeIfPresent(offerMode, forKey: "offerMode")
            try container.encodeIfPresent(periodCount, forKey: "periodCount")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(targetSubscriptionPlanType, forKey: "targetSubscriptionPlanType")
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
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "retentionOfferPrices" }

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

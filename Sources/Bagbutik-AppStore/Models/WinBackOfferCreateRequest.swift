import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WinBackOfferCreateRequest
 The request body you use to create a winback offer.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/winbackoffercreaterequest>
 */
public struct WinBackOfferCreateRequest: Codable, Sendable, RequestBody {
    public let data: Data
    public var included: [WinBackOfferPriceInlineCreate]?

    public init(data: Data,
                included: [WinBackOfferPriceInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([WinBackOfferPriceInlineCreate].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    public struct Data: Codable, Sendable {
        public var type: String { "winBackOffers" }
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

        public struct Attributes: Codable, Sendable {
            public let customerEligibilityPaidSubscriptionDurationInMonths: Int
            public let customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange
            public var customerEligibilityWaitBetweenOffersInMonths: Int?
            public let duration: SubscriptionOfferDuration
            public var endDate: String?
            public let offerId: String
            public let offerMode: SubscriptionOfferMode
            public let periodCount: Int
            public let priority: WinBackOffer.Attributes.Priority
            public var promotionIntent: WinBackOffer.Attributes.PromotionIntent?
            public let referenceName: String
            public let startDate: String

            public init(customerEligibilityPaidSubscriptionDurationInMonths: Int,
                        customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange,
                        customerEligibilityWaitBetweenOffersInMonths: Int? = nil,
                        duration: SubscriptionOfferDuration,
                        endDate: String? = nil,
                        offerId: String,
                        offerMode: SubscriptionOfferMode,
                        periodCount: Int,
                        priority: WinBackOffer.Attributes.Priority,
                        promotionIntent: WinBackOffer.Attributes.PromotionIntent? = nil,
                        referenceName: String,
                        startDate: String)
            {
                self.customerEligibilityPaidSubscriptionDurationInMonths = customerEligibilityPaidSubscriptionDurationInMonths
                self.customerEligibilityTimeSinceLastSubscribedInMonths = customerEligibilityTimeSinceLastSubscribedInMonths
                self.customerEligibilityWaitBetweenOffersInMonths = customerEligibilityWaitBetweenOffersInMonths
                self.duration = duration
                self.endDate = endDate
                self.offerId = offerId
                self.offerMode = offerMode
                self.periodCount = periodCount
                self.priority = priority
                self.promotionIntent = promotionIntent
                self.referenceName = referenceName
                self.startDate = startDate
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                customerEligibilityPaidSubscriptionDurationInMonths = try container.decode(Int.self, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
                customerEligibilityTimeSinceLastSubscribedInMonths = try container.decode(IntegerRange.self, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
                customerEligibilityWaitBetweenOffersInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityWaitBetweenOffersInMonths")
                duration = try container.decode(SubscriptionOfferDuration.self, forKey: "duration")
                endDate = try container.decodeIfPresent(String.self, forKey: "endDate")
                offerId = try container.decode(String.self, forKey: "offerId")
                offerMode = try container.decode(SubscriptionOfferMode.self, forKey: "offerMode")
                periodCount = try container.decode(Int.self, forKey: "periodCount")
                priority = try container.decode(WinBackOffer.Attributes.Priority.self, forKey: "priority")
                promotionIntent = try container.decodeIfPresent(WinBackOffer.Attributes.PromotionIntent.self, forKey: "promotionIntent")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                startDate = try container.decode(String.self, forKey: "startDate")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(customerEligibilityPaidSubscriptionDurationInMonths, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
                try container.encode(customerEligibilityTimeSinceLastSubscribedInMonths, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
                try container.encodeIfPresent(customerEligibilityWaitBetweenOffersInMonths, forKey: "customerEligibilityWaitBetweenOffersInMonths")
                try container.encode(duration, forKey: "duration")
                try container.encodeIfPresent(endDate, forKey: "endDate")
                try container.encode(offerId, forKey: "offerId")
                try container.encode(offerMode, forKey: "offerMode")
                try container.encode(periodCount, forKey: "periodCount")
                try container.encode(priority, forKey: "priority")
                try container.encodeIfPresent(promotionIntent, forKey: "promotionIntent")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encode(startDate, forKey: "startDate")
            }
        }

        public struct Relationships: Codable, Sendable {
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

            public struct Prices: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "winBackOfferPrices" }

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
}

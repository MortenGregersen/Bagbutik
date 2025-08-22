import Bagbutik_Core
import Foundation

/**
 # WinBackOffer
 The data structure that represents a win-back offer resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/winbackoffer>
 */
public struct WinBackOffer: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "winBackOffers" }
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
        public var customerEligibilityPaidSubscriptionDurationInMonths: Int?
        public var customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange?
        public var customerEligibilityWaitBetweenOffersInMonths: Int?
        public var duration: SubscriptionOfferDuration?
        public var endDate: String?
        public var offerId: String?
        public var offerMode: SubscriptionOfferMode?
        public var periodCount: Int?
        public var priority: Priority?
        public var promotionIntent: PromotionIntent?
        public var referenceName: String?
        public var startDate: String?

        public init(customerEligibilityPaidSubscriptionDurationInMonths: Int? = nil,
                    customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange? = nil,
                    customerEligibilityWaitBetweenOffersInMonths: Int? = nil,
                    duration: SubscriptionOfferDuration? = nil,
                    endDate: String? = nil,
                    offerId: String? = nil,
                    offerMode: SubscriptionOfferMode? = nil,
                    periodCount: Int? = nil,
                    priority: Priority? = nil,
                    promotionIntent: PromotionIntent? = nil,
                    referenceName: String? = nil,
                    startDate: String? = nil)
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
            customerEligibilityPaidSubscriptionDurationInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
            customerEligibilityTimeSinceLastSubscribedInMonths = try container.decodeIfPresent(IntegerRange.self, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
            customerEligibilityWaitBetweenOffersInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityWaitBetweenOffersInMonths")
            duration = try container.decodeIfPresent(SubscriptionOfferDuration.self, forKey: "duration")
            endDate = try container.decodeIfPresent(String.self, forKey: "endDate")
            offerId = try container.decodeIfPresent(String.self, forKey: "offerId")
            offerMode = try container.decodeIfPresent(SubscriptionOfferMode.self, forKey: "offerMode")
            periodCount = try container.decodeIfPresent(Int.self, forKey: "periodCount")
            priority = try container.decodeIfPresent(Priority.self, forKey: "priority")
            promotionIntent = try container.decodeIfPresent(PromotionIntent.self, forKey: "promotionIntent")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            startDate = try container.decodeIfPresent(String.self, forKey: "startDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(customerEligibilityPaidSubscriptionDurationInMonths, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
            try container.encodeIfPresent(customerEligibilityTimeSinceLastSubscribedInMonths, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
            try container.encodeIfPresent(customerEligibilityWaitBetweenOffersInMonths, forKey: "customerEligibilityWaitBetweenOffersInMonths")
            try container.encodeIfPresent(duration, forKey: "duration")
            try container.encodeIfPresent(endDate, forKey: "endDate")
            try container.encodeIfPresent(offerId, forKey: "offerId")
            try container.encodeIfPresent(offerMode, forKey: "offerMode")
            try container.encodeIfPresent(periodCount, forKey: "periodCount")
            try container.encodeIfPresent(priority, forKey: "priority")
            try container.encodeIfPresent(promotionIntent, forKey: "promotionIntent")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(startDate, forKey: "startDate")
        }

        public enum Priority: String, Sendable, Codable, CaseIterable {
            case high = "HIGH"
            case normal = "NORMAL"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Priority(rawValue: string) {
                    self = value
                } else if let value = Priority(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Priority value: \(string)"
                    )
                }
            }
        }

        public enum PromotionIntent: String, Sendable, Codable, CaseIterable {
            case notPromoted = "NOT_PROMOTED"
            case useAutoGeneratedAssets = "USE_AUTO_GENERATED_ASSETS"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PromotionIntent(rawValue: string) {
                    self = value
                } else if let value = PromotionIntent(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PromotionIntent value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var prices: Prices?

        public init(prices: Prices? = nil) {
            self.prices = prices
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            prices = try container.decodeIfPresent(Prices.self, forKey: "prices")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(prices, forKey: "prices")
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
    }
}

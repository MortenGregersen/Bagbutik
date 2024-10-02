import Bagbutik_Core
import Foundation

public struct WinBackOfferUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "winBackOffers" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var customerEligibilityPaidSubscriptionDurationInMonths: Int?
            public var customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange?
            public var customerEligibilityWaitBetweenOffersInMonths: Int?
            public var endDate: String?
            public var priority: WinBackOffer.Attributes.Priority?
            public var promotionIntent: WinBackOffer.Attributes.PromotionIntent?
            public var startDate: String?

            public init(customerEligibilityPaidSubscriptionDurationInMonths: Int? = nil,
                        customerEligibilityTimeSinceLastSubscribedInMonths: IntegerRange? = nil,
                        customerEligibilityWaitBetweenOffersInMonths: Int? = nil,
                        endDate: String? = nil,
                        priority: WinBackOffer.Attributes.Priority? = nil,
                        promotionIntent: WinBackOffer.Attributes.PromotionIntent? = nil,
                        startDate: String? = nil)
            {
                self.customerEligibilityPaidSubscriptionDurationInMonths = customerEligibilityPaidSubscriptionDurationInMonths
                self.customerEligibilityTimeSinceLastSubscribedInMonths = customerEligibilityTimeSinceLastSubscribedInMonths
                self.customerEligibilityWaitBetweenOffersInMonths = customerEligibilityWaitBetweenOffersInMonths
                self.endDate = endDate
                self.priority = priority
                self.promotionIntent = promotionIntent
                self.startDate = startDate
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                customerEligibilityPaidSubscriptionDurationInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
                customerEligibilityTimeSinceLastSubscribedInMonths = try container.decodeIfPresent(IntegerRange.self, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
                customerEligibilityWaitBetweenOffersInMonths = try container.decodeIfPresent(Int.self, forKey: "customerEligibilityWaitBetweenOffersInMonths")
                endDate = try container.decodeIfPresent(String.self, forKey: "endDate")
                priority = try container.decodeIfPresent(WinBackOffer.Attributes.Priority.self, forKey: "priority")
                promotionIntent = try container.decodeIfPresent(WinBackOffer.Attributes.PromotionIntent.self, forKey: "promotionIntent")
                startDate = try container.decodeIfPresent(String.self, forKey: "startDate")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(customerEligibilityPaidSubscriptionDurationInMonths, forKey: "customerEligibilityPaidSubscriptionDurationInMonths")
                try container.encodeIfPresent(customerEligibilityTimeSinceLastSubscribedInMonths, forKey: "customerEligibilityTimeSinceLastSubscribedInMonths")
                try container.encodeIfPresent(customerEligibilityWaitBetweenOffersInMonths, forKey: "customerEligibilityWaitBetweenOffersInMonths")
                try container.encodeIfPresent(endDate, forKey: "endDate")
                try container.encodeIfPresent(priority, forKey: "priority")
                try container.encodeIfPresent(promotionIntent, forKey: "promotionIntent")
                try container.encodeIfPresent(startDate, forKey: "startDate")
            }
        }
    }
}

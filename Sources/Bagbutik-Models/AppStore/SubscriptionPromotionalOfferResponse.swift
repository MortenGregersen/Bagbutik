import Bagbutik_Core
import Foundation

public struct SubscriptionPromotionalOfferResponse: Codable {
    public let data: SubscriptionPromotionalOffer
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionPromotionalOffer,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getPrices() -> [SubscriptionPromotionalOfferPrice] {
        guard let priceIds = data.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionPromotionalOfferPrice? in
                  guard case let .subscriptionPromotionalOfferPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getSubscription() -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == data.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable {
        case subscription(Subscription)
        case subscriptionPromotionalOfferPrice(SubscriptionPromotionalOfferPrice)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let subscriptionPromotionalOfferPrice = try? SubscriptionPromotionalOfferPrice(from: decoder) {
                self = .subscriptionPromotionalOfferPrice(subscriptionPromotionalOfferPrice)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .subscriptionPromotionalOfferPrice(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

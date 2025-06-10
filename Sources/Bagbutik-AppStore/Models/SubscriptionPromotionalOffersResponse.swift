import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct SubscriptionPromotionalOffersResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionPromotionalOffer

    public let data: [SubscriptionPromotionalOffer]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionPromotionalOffer],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([SubscriptionPromotionalOffer].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getPrices(for subscriptionPromotionalOffer: SubscriptionPromotionalOffer) -> [SubscriptionPromotionalOfferPrice] {
        guard let priceIds = subscriptionPromotionalOffer.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionPromotionalOfferPrice? in
                  guard case let .subscriptionPromotionalOfferPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getSubscription(for subscriptionPromotionalOffer: SubscriptionPromotionalOffer) -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == subscriptionPromotionalOffer.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscription(Subscription)
        case subscriptionPromotionalOfferPrice(SubscriptionPromotionalOfferPrice)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let subscriptionPromotionalOfferPrice = try? SubscriptionPromotionalOfferPrice(from: decoder) {
                self = .subscriptionPromotionalOfferPrice(subscriptionPromotionalOfferPrice)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
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
    }
}

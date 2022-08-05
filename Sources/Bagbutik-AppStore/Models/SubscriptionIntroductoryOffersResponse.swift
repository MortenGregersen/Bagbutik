import Bagbutik_Core
import Foundation

public struct SubscriptionIntroductoryOffersResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionIntroductoryOffer

    public let data: [SubscriptionIntroductoryOffer]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionIntroductoryOffer],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getSubscription(for subscriptionIntroductoryOffer: SubscriptionIntroductoryOffer) -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == subscriptionIntroductoryOffer.relationships?.subscription?.data?.id }
    }

    public func getSubscriptionPricePoint(for subscriptionIntroductoryOffer: SubscriptionIntroductoryOffer) -> SubscriptionPricePoint? {
        included?.compactMap { relationship -> SubscriptionPricePoint? in
            guard case let .subscriptionPricePoint(subscriptionPricePoint) = relationship else { return nil }
            return subscriptionPricePoint
        }.first { $0.id == subscriptionIntroductoryOffer.relationships?.subscriptionPricePoint?.data?.id }
    }

    public func getTerritory(for subscriptionIntroductoryOffer: SubscriptionIntroductoryOffer) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == subscriptionIntroductoryOffer.relationships?.territory?.data?.id }
    }

    public enum Included: Codable {
        case subscription(Subscription)
        case subscriptionPricePoint(SubscriptionPricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let subscriptionPricePoint = try? SubscriptionPricePoint(from: decoder) {
                self = .subscriptionPricePoint(subscriptionPricePoint)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .subscriptionPricePoint(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

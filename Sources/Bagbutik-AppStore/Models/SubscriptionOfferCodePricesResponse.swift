import Foundation
import Bagbutik_Core

public struct SubscriptionOfferCodePricesResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionOfferCodePrice

    public let data: [SubscriptionOfferCodePrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionOfferCodePrice],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getSubscriptionPricePoint(for subscriptionOfferCodePrice: SubscriptionOfferCodePrice) -> SubscriptionPricePoint? {
        included?.compactMap { relationship -> SubscriptionPricePoint? in
            guard case let .subscriptionPricePoint(subscriptionPricePoint) = relationship else { return nil }
            return subscriptionPricePoint
        }.first { $0.id == subscriptionOfferCodePrice.relationships?.subscriptionPricePoint?.data?.id }
    }

    public func getTerritory(for subscriptionOfferCodePrice: SubscriptionOfferCodePrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == subscriptionOfferCodePrice.relationships?.territory?.data?.id }
    }

    public enum Included: Codable {
        case subscriptionPricePoint(SubscriptionPricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let subscriptionPricePoint = try? SubscriptionPricePoint(from: decoder) {
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

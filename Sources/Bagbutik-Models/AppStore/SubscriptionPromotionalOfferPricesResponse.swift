import Bagbutik_Core
import Foundation

public struct SubscriptionPromotionalOfferPricesResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionPromotionalOfferPrice

    public let data: [SubscriptionPromotionalOfferPrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionPromotionalOfferPrice],
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
        data = try container.decode([SubscriptionPromotionalOfferPrice].self, forKey: "data")
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

    public func getSubscriptionPricePoint(for subscriptionPromotionalOfferPrice: SubscriptionPromotionalOfferPrice) -> SubscriptionPricePoint? {
        included?.compactMap { relationship -> SubscriptionPricePoint? in
            guard case let .subscriptionPricePoint(subscriptionPricePoint) = relationship else { return nil }
            return subscriptionPricePoint
        }.first { $0.id == subscriptionPromotionalOfferPrice.relationships?.subscriptionPricePoint?.data?.id }
    }

    public func getTerritory(for subscriptionPromotionalOfferPrice: SubscriptionPromotionalOfferPrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == subscriptionPromotionalOfferPrice.relationships?.territory?.data?.id }
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
    }
}

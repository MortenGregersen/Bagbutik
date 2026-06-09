import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WinBackOfferPricesResponse
 The response body for endpoints that list prices for a win-back offer.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/winbackofferpricesresponse>
 */
public struct WinBackOfferPricesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = WinBackOfferPrice

    public let data: [WinBackOfferPrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [WinBackOfferPrice],
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
        data = try container.decode([WinBackOfferPrice].self, forKey: "data")
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

    public func getSubscriptionPricePoint(for winBackOfferPrice: WinBackOfferPrice) -> SubscriptionPricePoint? {
        included?.compactMap { relationship -> SubscriptionPricePoint? in
            guard case let .subscriptionPricePoint(subscriptionPricePoint) = relationship else { return nil }
            return subscriptionPricePoint
        }.first { $0.id == winBackOfferPrice.relationships?.subscriptionPricePoint?.data?.id }
    }

    public func getTerritory(for winBackOfferPrice: WinBackOfferPrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == winBackOfferPrice.relationships?.territory?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscriptionPricePoint(SubscriptionPricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "subscriptionPricePoints":
                self = .subscriptionPricePoint(try SubscriptionPricePoint(from: decoder))
            case "territories":
                self = .territory(try Territory(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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

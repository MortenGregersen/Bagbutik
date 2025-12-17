import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseOfferPricesResponse
 A response that contains a list of in-app purchase offer price resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseofferpricesresponse>
 */
public struct InAppPurchaseOfferPricesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseOfferPrice

    public let data: [InAppPurchaseOfferPrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseOfferPrice],
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
        data = try container.decode([InAppPurchaseOfferPrice].self, forKey: "data")
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

    public func getPricePoint(for inAppPurchaseOfferPrice: InAppPurchaseOfferPrice) -> InAppPurchasePricePoint? {
        included?.compactMap { relationship -> InAppPurchasePricePoint? in
            guard case let .inAppPurchasePricePoint(pricePoint) = relationship else { return nil }
            return pricePoint
        }.first { $0.id == inAppPurchaseOfferPrice.relationships?.pricePoint?.data?.id }
    }

    public func getTerritory(for inAppPurchaseOfferPrice: InAppPurchaseOfferPrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == inAppPurchaseOfferPrice.relationships?.territory?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case inAppPurchasePricePoint(InAppPurchasePricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let inAppPurchasePricePoint = try? InAppPurchasePricePoint(from: decoder) {
                self = .inAppPurchasePricePoint(inAppPurchasePricePoint)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
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
            case let .inAppPurchasePricePoint(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}

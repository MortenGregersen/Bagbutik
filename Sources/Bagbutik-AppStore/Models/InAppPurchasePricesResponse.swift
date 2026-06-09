import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct InAppPurchasePricesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchasePrice

    public let data: [InAppPurchasePrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchasePrice],
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
        data = try container.decode([InAppPurchasePrice].self, forKey: "data")
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

    public func getInAppPurchasePricePoint(for inAppPurchasePrice: InAppPurchasePrice) -> InAppPurchasePricePoint? {
        included?.compactMap { relationship -> InAppPurchasePricePoint? in
            guard case let .inAppPurchasePricePoint(inAppPurchasePricePoint) = relationship else { return nil }
            return inAppPurchasePricePoint
        }.first { $0.id == inAppPurchasePrice.relationships?.inAppPurchasePricePoint?.data?.id }
    }

    public func getTerritory(for inAppPurchasePrice: InAppPurchasePrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == inAppPurchasePrice.relationships?.territory?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case inAppPurchasePricePoint(InAppPurchasePricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "inAppPurchasePricePoints":
                self = .inAppPurchasePricePoint(try InAppPurchasePricePoint(from: decoder))
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
            case let .inAppPurchasePricePoint(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}

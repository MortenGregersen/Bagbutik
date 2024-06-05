import Bagbutik_Core
import Foundation

/**
 # AppPricePointsResponse
 A response that contains a list of App Price Point resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricepointsresponse>
 */
public struct AppPricePointsResponse: Codable, PagedResponse {
    public typealias Data = AppPricePoint

    public let data: [AppPricePoint]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppPricePoint],
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
        data = try container.decode([AppPricePoint].self, forKey: "data")
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

    public func getPriceTier(for appPricePoint: AppPricePoint) -> AppPriceTier? {
        included?.compactMap { relationship -> AppPriceTier? in
            guard case let .appPriceTier(priceTier) = relationship else { return nil }
            return priceTier
        }.first { $0.id == appPricePoint.relationships?.priceTier?.data?.id }
    }

    public func getTerritory(for appPricePoint: AppPricePoint) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == appPricePoint.relationships?.territory?.data?.id }
    }

    public enum Included: Codable {
        case appPriceTier(AppPriceTier)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let appPriceTier = try? AppPriceTier(from: decoder) {
                self = .appPriceTier(appPriceTier)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appPriceTier(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}

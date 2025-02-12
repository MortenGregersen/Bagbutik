import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct AppPricesV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = AppPriceV2

    public let data: [AppPriceV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppPriceV2],
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
        data = try container.decode([AppPriceV2].self, forKey: "data")
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

    public func getAppPricePoint(for appPriceV2: AppPriceV2) -> AppPricePointV3? {
        included?.compactMap { relationship -> AppPricePointV3? in
            guard case let .appPricePointV3(appPricePoint) = relationship else { return nil }
            return appPricePoint
        }.first { $0.id == appPriceV2.relationships?.appPricePoint?.data?.id }
    }

    public func getTerritory(for appPriceV2: AppPriceV2) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == appPriceV2.relationships?.territory?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appPricePointV3(AppPricePointV3)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let appPricePointV3 = try? AppPricePointV3(from: decoder) {
                self = .appPricePointV3(appPricePointV3)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appPricePointV3(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}

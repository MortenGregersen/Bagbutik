import Bagbutik_Core
import Foundation

/**
 # AppPricePointsV2Response
 A response that contains a list of App Price Points V2 resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricepointsv2response>
 */
public struct AppPricePointsV2Response: Codable, PagedResponse {
    public typealias Data = AppPricePointV2

    /// The resource data.
    public let data: [AppPricePointV2]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [AppPricePointV2],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getApp(for appPricePointV2: AppPricePointV2) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appPricePointV2.relationships?.app?.data?.id }
    }

    public func getPriceTier(for appPricePointV2: AppPricePointV2) -> AppPriceTier? {
        included?.compactMap { relationship -> AppPriceTier? in
            guard case let .appPriceTier(priceTier) = relationship else { return nil }
            return priceTier
        }.first { $0.id == appPricePointV2.relationships?.priceTier?.data?.id }
    }

    public func getTerritory(for appPricePointV2: AppPricePointV2) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == appPricePointV2.relationships?.territory?.data?.id }
    }

    public enum Included: Codable {
        case app(App)
        case appPriceTier(AppPriceTier)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appPriceTier = try? AppPriceTier(from: decoder) {
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
            case let .app(value):
                try value.encode(to: encoder)
            case let .appPriceTier(value):
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

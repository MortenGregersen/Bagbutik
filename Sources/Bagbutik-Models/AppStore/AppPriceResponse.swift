import Bagbutik_Core
import Foundation

/**
 # AppPriceResponse
 A response that contains a single App Price resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppriceresponse>
 */
public struct AppPriceResponse: Codable {
    /// The resource data.
    public let data: AppPrice
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPrice,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getPriceTier() -> AppPriceTier? {
        included?.compactMap { relationship -> AppPriceTier? in
            guard case let .appPriceTier(priceTier) = relationship else { return nil }
            return priceTier
        }.first { $0.id == data.relationships?.priceTier?.data?.id }
    }

    public enum Included: Codable {
        case app(App)
        case appPriceTier(AppPriceTier)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appPriceTier = try? AppPriceTier(from: decoder) {
                self = .appPriceTier(appPriceTier)
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
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

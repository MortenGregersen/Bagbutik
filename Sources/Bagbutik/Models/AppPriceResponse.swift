import Foundation

/**
 A response that contains a single App Prices resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppriceresponse>
 */
public struct AppPriceResponse: Codable {
    /// The resource data.
    public let data: AppPrice
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPrice, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
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

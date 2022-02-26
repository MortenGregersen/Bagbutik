import Foundation

/**
 A response that contains a list of App Prices resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricesresponse>
 */
public struct AppPricesResponse: Codable, PagedResponse {
    public typealias Data = AppPrice
    /// The resource data.
    public let data: [AppPrice]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppPrice], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
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

import Foundation

public struct AppCustomProductPageVersionResponse: Codable {
    /// The resource data.
    public let data: AppCustomProductPageVersion
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppCustomProductPageVersion, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appCustomProductPage(AppCustomProductPage)
        case appCustomProductPageLocalization(AppCustomProductPageLocalization)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPage = try? AppCustomProductPage(from: decoder) {
                self = .appCustomProductPage(appCustomProductPage)
            } else if let appCustomProductPageLocalization = try? AppCustomProductPageLocalization(from: decoder) {
                self = .appCustomProductPageLocalization(appCustomProductPageLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPage(value):
                try value.encode(to: encoder)
            case let .appCustomProductPageLocalization(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

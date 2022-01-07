import Foundation

/**
 A response that contains a list of App Info resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfosresponse>
 */
public struct AppInfosResponse: Codable, PagedResponse {
    public typealias Data = AppInfo
    /// The resource data.
    public let data: [AppInfo]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppInfo], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case ageRatingDeclaration(AgeRatingDeclaration)
        case app(App)
        case appCategory(AppCategory)
        case appInfoLocalization(AppInfoLocalization)

        public init(from decoder: Decoder) throws {
            if let ageRatingDeclaration = try? AgeRatingDeclaration(from: decoder) {
                self = .ageRatingDeclaration(ageRatingDeclaration)
            } else if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appCategory = try? AppCategory(from: decoder) {
                self = .appCategory(appCategory)
            } else if let appInfoLocalization = try? AppInfoLocalization(from: decoder) {
                self = .appInfoLocalization(appInfoLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .ageRatingDeclaration(value):
                try value.encode(to: encoder)
            case let .app(value):
                try value.encode(to: encoder)
            case let .appCategory(value):
                try value.encode(to: encoder)
            case let .appInfoLocalization(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

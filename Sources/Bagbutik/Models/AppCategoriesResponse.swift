import Foundation

/**
 A response that contains a list of App Category resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoriesresponse>
 */
public struct AppCategoriesResponse: Codable, PagedResponse {
    public typealias Data = AppCategory
    /// The resource data.
    public let data: [AppCategory]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppCategory], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appCategory(AppCategory)

        public init(from decoder: Decoder) throws {
            if let appCategory = try? AppCategory(from: decoder) {
                self = .appCategory(appCategory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCategory(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

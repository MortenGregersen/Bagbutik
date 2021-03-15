import Foundation

/// A response that contains a list of App Category resources.
public struct AppCategoriesResponse: Codable {
    /// The resource data.
    public let data: [AppCategory]
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
        case parent(AppCategory)
        case subcategories(AppCategory)

        public init(from decoder: Decoder) throws {
            if let parent = try? AppCategory(from: decoder) {
                self = .parent(parent)
            } else if let subcategories = try? AppCategory(from: decoder) {
                self = .subcategories(subcategories)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .parent(value):
                try value.encode(to: encoder)
            case let .subcategories(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case parent
            case subcategories
        }
    }
}

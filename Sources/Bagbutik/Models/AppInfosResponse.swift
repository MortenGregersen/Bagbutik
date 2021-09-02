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
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppInfo], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appInfoLocalizations(AppInfoLocalization)
        case primaryCategory(AppCategory)
        case primarySubcategoryOne(AppCategory)
        case primarySubcategoryTwo(AppCategory)
        case secondaryCategory(AppCategory)
        case secondarySubcategoryOne(AppCategory)
        case secondarySubcategoryTwo(AppCategory)

        public init(from decoder: Decoder) throws {
            if let appInfoLocalizations = try? AppInfoLocalization(from: decoder) {
                self = .appInfoLocalizations(appInfoLocalizations)
            } else if let primaryCategory = try? AppCategory(from: decoder) {
                self = .primaryCategory(primaryCategory)
            } else if let primarySubcategoryOne = try? AppCategory(from: decoder) {
                self = .primarySubcategoryOne(primarySubcategoryOne)
            } else if let primarySubcategoryTwo = try? AppCategory(from: decoder) {
                self = .primarySubcategoryTwo(primarySubcategoryTwo)
            } else if let secondaryCategory = try? AppCategory(from: decoder) {
                self = .secondaryCategory(secondaryCategory)
            } else if let secondarySubcategoryOne = try? AppCategory(from: decoder) {
                self = .secondarySubcategoryOne(secondarySubcategoryOne)
            } else if let secondarySubcategoryTwo = try? AppCategory(from: decoder) {
                self = .secondarySubcategoryTwo(secondarySubcategoryTwo)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appInfoLocalizations(value):
                try value.encode(to: encoder)
            case let .primaryCategory(value):
                try value.encode(to: encoder)
            case let .primarySubcategoryOne(value):
                try value.encode(to: encoder)
            case let .primarySubcategoryTwo(value):
                try value.encode(to: encoder)
            case let .secondaryCategory(value):
                try value.encode(to: encoder)
            case let .secondarySubcategoryOne(value):
                try value.encode(to: encoder)
            case let .secondarySubcategoryTwo(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appInfoLocalizations
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
        }
    }
}

import Foundation
import Bagbutik_Core

/**
 # AppCategoriesResponse
 A response that contains a list of App Category resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoriesresponse>
 */
public struct AppCategoriesResponse: Codable, PagedResponse {
    public typealias Data = AppCategory

    public let data: [AppCategory]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCategory],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getParent(for appCategory: AppCategory) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(parent) = relationship else { return nil }
            return parent
        }.first { $0.id == appCategory.relationships?.parent?.data?.id }
    }

    public func getSubcategories(for appCategory: AppCategory) -> [AppCategory] {
        guard let subcategoryIds = appCategory.relationships?.subcategories?.data?.map(\.id),
              let subcategories = included?.compactMap({ relationship -> AppCategory? in
                  guard case let .appCategory(subcategory) = relationship else { return nil }
                  return subcategoryIds.contains(subcategory.id) ? subcategory : nil
              })
        else {
            return []
        }
        return subcategories
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

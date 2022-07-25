import Foundation

/**
 A response that contains a single App Categories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoryresponse>
 */
public struct AppCategoryResponse: Codable {
    public let data: AppCategory
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppCategory, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getParent() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(parent) = relationship else { return nil }
            return parent
        }.first { $0.id == data.relationships?.parent?.data?.id }
    }

    public func getSubcategories() -> [AppCategory] {
        guard let subcategoryIds = data.relationships?.subcategories?.data?.map(\.id),
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

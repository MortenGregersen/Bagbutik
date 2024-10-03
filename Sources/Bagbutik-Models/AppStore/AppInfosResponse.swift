import Bagbutik_Core
import Foundation

public struct AppInfosResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppInfo

    public let data: [AppInfo]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppInfo],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AppInfo].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getAgeRatingDeclaration(for appInfo: AppInfo) -> AgeRatingDeclaration? {
        included?.compactMap { relationship -> AgeRatingDeclaration? in
            guard case let .ageRatingDeclaration(ageRatingDeclaration) = relationship else { return nil }
            return ageRatingDeclaration
        }.first { $0.id == appInfo.relationships?.ageRatingDeclaration?.data?.id }
    }

    public func getApp(for appInfo: AppInfo) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appInfo.relationships?.app?.data?.id }
    }

    public func getAppInfoLocalizations(for appInfo: AppInfo) -> [AppInfoLocalization] {
        guard let appInfoLocalizationIds = appInfo.relationships?.appInfoLocalizations?.data?.map(\.id),
              let appInfoLocalizations = included?.compactMap({ relationship -> AppInfoLocalization? in
                  guard case let .appInfoLocalization(appInfoLocalization) = relationship else { return nil }
                  return appInfoLocalizationIds.contains(appInfoLocalization.id) ? appInfoLocalization : nil
              })
        else {
            return []
        }
        return appInfoLocalizations
    }

    public func getPrimaryCategory(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primaryCategory) = relationship else { return nil }
            return primaryCategory
        }.first { $0.id == appInfo.relationships?.primaryCategory?.data?.id }
    }

    public func getPrimarySubcategoryOne(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primarySubcategoryOne) = relationship else { return nil }
            return primarySubcategoryOne
        }.first { $0.id == appInfo.relationships?.primarySubcategoryOne?.data?.id }
    }

    public func getPrimarySubcategoryTwo(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primarySubcategoryTwo) = relationship else { return nil }
            return primarySubcategoryTwo
        }.first { $0.id == appInfo.relationships?.primarySubcategoryTwo?.data?.id }
    }

    public func getSecondaryCategory(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondaryCategory) = relationship else { return nil }
            return secondaryCategory
        }.first { $0.id == appInfo.relationships?.secondaryCategory?.data?.id }
    }

    public func getSecondarySubcategoryOne(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondarySubcategoryOne) = relationship else { return nil }
            return secondarySubcategoryOne
        }.first { $0.id == appInfo.relationships?.secondarySubcategoryOne?.data?.id }
    }

    public func getSecondarySubcategoryTwo(for appInfo: AppInfo) -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondarySubcategoryTwo) = relationship else { return nil }
            return secondarySubcategoryTwo
        }.first { $0.id == appInfo.relationships?.secondarySubcategoryTwo?.data?.id }
    }

    public enum Included: Codable, Sendable {
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
    }
}

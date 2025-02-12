import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppInfoResponse
 A response that contains a single App Infos resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinforesponse>
 */
public struct AppInfoResponse: Codable, Sendable {
    /// The resource data.
    public let data: AppInfo
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppInfo,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppInfo.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAgeRatingDeclaration() -> AgeRatingDeclaration? {
        included?.compactMap { relationship -> AgeRatingDeclaration? in
            guard case let .ageRatingDeclaration(ageRatingDeclaration) = relationship else { return nil }
            return ageRatingDeclaration
        }.first { $0.id == data.relationships?.ageRatingDeclaration?.data?.id }
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppInfoLocalizations() -> [AppInfoLocalization] {
        guard let appInfoLocalizationIds = data.relationships?.appInfoLocalizations?.data?.map(\.id),
              let appInfoLocalizations = included?.compactMap({ relationship -> AppInfoLocalization? in
                  guard case let .appInfoLocalization(appInfoLocalization) = relationship else { return nil }
                  return appInfoLocalizationIds.contains(appInfoLocalization.id) ? appInfoLocalization : nil
              })
        else {
            return []
        }
        return appInfoLocalizations
    }

    public func getPrimaryCategory() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primaryCategory) = relationship else { return nil }
            return primaryCategory
        }.first { $0.id == data.relationships?.primaryCategory?.data?.id }
    }

    public func getPrimarySubcategoryOne() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primarySubcategoryOne) = relationship else { return nil }
            return primarySubcategoryOne
        }.first { $0.id == data.relationships?.primarySubcategoryOne?.data?.id }
    }

    public func getPrimarySubcategoryTwo() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(primarySubcategoryTwo) = relationship else { return nil }
            return primarySubcategoryTwo
        }.first { $0.id == data.relationships?.primarySubcategoryTwo?.data?.id }
    }

    public func getSecondaryCategory() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondaryCategory) = relationship else { return nil }
            return secondaryCategory
        }.first { $0.id == data.relationships?.secondaryCategory?.data?.id }
    }

    public func getSecondarySubcategoryOne() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondarySubcategoryOne) = relationship else { return nil }
            return secondarySubcategoryOne
        }.first { $0.id == data.relationships?.secondarySubcategoryOne?.data?.id }
    }

    public func getSecondarySubcategoryTwo() -> AppCategory? {
        included?.compactMap { relationship -> AppCategory? in
            guard case let .appCategory(secondarySubcategoryTwo) = relationship else { return nil }
            return secondarySubcategoryTwo
        }.first { $0.id == data.relationships?.secondarySubcategoryTwo?.data?.id }
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

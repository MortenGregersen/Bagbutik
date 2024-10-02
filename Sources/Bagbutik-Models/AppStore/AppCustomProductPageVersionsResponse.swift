import Bagbutik_Core
import Foundation

public struct AppCustomProductPageVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppCustomProductPageVersion

    public let data: [AppCustomProductPageVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCustomProductPageVersion],
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
        data = try container.decode([AppCustomProductPageVersion].self, forKey: "data")
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

    public func getAppCustomProductPage(for appCustomProductPageVersion: AppCustomProductPageVersion) -> AppCustomProductPage? {
        included?.compactMap { relationship -> AppCustomProductPage? in
            guard case let .appCustomProductPage(appCustomProductPage) = relationship else { return nil }
            return appCustomProductPage
        }.first { $0.id == appCustomProductPageVersion.relationships?.appCustomProductPage?.data?.id }
    }

    public func getAppCustomProductPageLocalizations(for appCustomProductPageVersion: AppCustomProductPageVersion) -> [AppCustomProductPageLocalization] {
        guard let appCustomProductPageLocalizationIds = appCustomProductPageVersion.relationships?.appCustomProductPageLocalizations?.data?.map(\.id),
              let appCustomProductPageLocalizations = included?.compactMap({ relationship -> AppCustomProductPageLocalization? in
                  guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
                  return appCustomProductPageLocalizationIds.contains(appCustomProductPageLocalization.id) ? appCustomProductPageLocalization : nil
              })
        else {
            return []
        }
        return appCustomProductPageLocalizations
    }

    public enum Included: Codable, Sendable {
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
    }
}

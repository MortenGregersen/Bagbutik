import Bagbutik_Core
import Foundation

public struct AppCustomProductPageLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppCustomProductPageLocalization

    public let data: [AppCustomProductPageLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCustomProductPageLocalization],
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
        data = try container.decode([AppCustomProductPageLocalization].self, forKey: "data")
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

    public func getAppCustomProductPageVersion(for appCustomProductPageLocalization: AppCustomProductPageLocalization) -> AppCustomProductPageVersion? {
        included?.compactMap { relationship -> AppCustomProductPageVersion? in
            guard case let .appCustomProductPageVersion(appCustomProductPageVersion) = relationship else { return nil }
            return appCustomProductPageVersion
        }.first { $0.id == appCustomProductPageLocalization.relationships?.appCustomProductPageVersion?.data?.id }
    }

    public func getAppPreviewSets(for appCustomProductPageLocalization: AppCustomProductPageLocalization) -> [AppPreviewSet] {
        guard let appPreviewSetIds = appCustomProductPageLocalization.relationships?.appPreviewSets?.data?.map(\.id),
              let appPreviewSets = included?.compactMap({ relationship -> AppPreviewSet? in
                  guard case let .appPreviewSet(appPreviewSet) = relationship else { return nil }
                  return appPreviewSetIds.contains(appPreviewSet.id) ? appPreviewSet : nil
              })
        else {
            return []
        }
        return appPreviewSets
    }

    public func getAppScreenshotSets(for appCustomProductPageLocalization: AppCustomProductPageLocalization) -> [AppScreenshotSet] {
        guard let appScreenshotSetIds = appCustomProductPageLocalization.relationships?.appScreenshotSets?.data?.map(\.id),
              let appScreenshotSets = included?.compactMap({ relationship -> AppScreenshotSet? in
                  guard case let .appScreenshotSet(appScreenshotSet) = relationship else { return nil }
                  return appScreenshotSetIds.contains(appScreenshotSet.id) ? appScreenshotSet : nil
              })
        else {
            return []
        }
        return appScreenshotSets
    }

    public enum Included: Codable {
        case appCustomProductPageVersion(AppCustomProductPageVersion)
        case appPreviewSet(AppPreviewSet)
        case appScreenshotSet(AppScreenshotSet)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPageVersion = try? AppCustomProductPageVersion(from: decoder) {
                self = .appCustomProductPageVersion(appCustomProductPageVersion)
            } else if let appPreviewSet = try? AppPreviewSet(from: decoder) {
                self = .appPreviewSet(appPreviewSet)
            } else if let appScreenshotSet = try? AppScreenshotSet(from: decoder) {
                self = .appScreenshotSet(appScreenshotSet)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPageVersion(value):
                try value.encode(to: encoder)
            case let .appPreviewSet(value):
                try value.encode(to: encoder)
            case let .appScreenshotSet(value):
                try value.encode(to: encoder)
            }
        }
    }
}

import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppCustomProductPageLocalizationsResponse
 A response containing a list of localizations for a custom App Store product page.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpagelocalizationsresponse>
 */
public struct AppCustomProductPageLocalizationsResponse: Codable, Sendable, PagedResponse {
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

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
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

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
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

    public func getSearchKeywords(for appCustomProductPageLocalization: AppCustomProductPageLocalization) -> [AppKeyword] {
        guard let searchKeywordIds = appCustomProductPageLocalization.relationships?.searchKeywords?.data?.map(\.id),
              let searchKeywords = included?.compactMap({ relationship -> AppKeyword? in
                  guard case let .appKeyword(searchKeyword) = relationship else { return nil }
                  return searchKeywordIds.contains(searchKeyword.id) ? searchKeyword : nil
              })
        else {
            return []
        }
        return searchKeywords
    }

    public enum Included: Codable, Sendable {
        case appCustomProductPageVersion(AppCustomProductPageVersion)
        case appKeyword(AppKeyword)
        case appPreviewSet(AppPreviewSet)
        case appScreenshotSet(AppScreenshotSet)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appCustomProductPageVersions":
                self = .appCustomProductPageVersion(try AppCustomProductPageVersion(from: decoder))
            case "appKeywords":
                self = .appKeyword(try AppKeyword(from: decoder))
            case "appPreviewSets":
                self = .appPreviewSet(try AppPreviewSet(from: decoder))
            case "appScreenshotSets":
                self = .appScreenshotSet(try AppScreenshotSet(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPageVersion(value):
                try value.encode(to: encoder)
            case let .appKeyword(value):
                try value.encode(to: encoder)
            case let .appPreviewSet(value):
                try value.encode(to: encoder)
            case let .appScreenshotSet(value):
                try value.encode(to: encoder)
            }
        }
    }
}

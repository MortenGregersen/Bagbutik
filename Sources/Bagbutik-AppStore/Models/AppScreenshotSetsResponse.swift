import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppScreenshotSetsResponse
 A response that contains a list of app screenshot set resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsetsresponse>
 */
public struct AppScreenshotSetsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppScreenshotSet

    public let data: [AppScreenshotSet]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppScreenshotSet],
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
        data = try container.decode([AppScreenshotSet].self, forKey: "data")
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

    public func getAppCustomProductPageLocalization(for appScreenshotSet: AppScreenshotSet) -> AppCustomProductPageLocalization? {
        included?.compactMap { relationship -> AppCustomProductPageLocalization? in
            guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
            return appCustomProductPageLocalization
        }.first { $0.id == appScreenshotSet.relationships?.appCustomProductPageLocalization?.data?.id }
    }

    public func getAppScreenshots(for appScreenshotSet: AppScreenshotSet) -> [AppScreenshot] {
        guard let appScreenshotIds = appScreenshotSet.relationships?.appScreenshots?.data?.map(\.id),
              let appScreenshots = included?.compactMap({ relationship -> AppScreenshot? in
                  guard case let .appScreenshot(appScreenshot) = relationship else { return nil }
                  return appScreenshotIds.contains(appScreenshot.id) ? appScreenshot : nil
              })
        else {
            return []
        }
        return appScreenshots
    }

    public func getAppStoreVersionExperimentTreatmentLocalization(for appScreenshotSet: AppScreenshotSet) -> AppStoreVersionExperimentTreatmentLocalization? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatmentLocalization? in
            guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
            return appStoreVersionExperimentTreatmentLocalization
        }.first { $0.id == appScreenshotSet.relationships?.appStoreVersionExperimentTreatmentLocalization?.data?.id }
    }

    public func getAppStoreVersionLocalization(for appScreenshotSet: AppScreenshotSet) -> AppStoreVersionLocalization? {
        included?.compactMap { relationship -> AppStoreVersionLocalization? in
            guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
            return appStoreVersionLocalization
        }.first { $0.id == appScreenshotSet.relationships?.appStoreVersionLocalization?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appCustomProductPageLocalization(AppCustomProductPageLocalization)
        case appScreenshot(AppScreenshot)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)
        case appStoreVersionLocalization(AppStoreVersionLocalization)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPageLocalization = try? AppCustomProductPageLocalization(from: decoder) {
                self = .appCustomProductPageLocalization(appCustomProductPageLocalization)
            } else if let appScreenshot = try? AppScreenshot(from: decoder) {
                self = .appScreenshot(appScreenshot)
            } else if let appStoreVersionExperimentTreatmentLocalization = try? AppStoreVersionExperimentTreatmentLocalization(from: decoder) {
                self = .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization)
            } else if let appStoreVersionLocalization = try? AppStoreVersionLocalization(from: decoder) {
                self = .appStoreVersionLocalization(appStoreVersionLocalization)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPageLocalization(value):
                try value.encode(to: encoder)
            case let .appScreenshot(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatmentLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}

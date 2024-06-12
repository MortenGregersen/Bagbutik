import Bagbutik_Core
import Foundation

/**
 # AppScreenshotSetResponse
 A response that contains a single app screenshot set resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsetresponse>
 */
public struct AppScreenshotSetResponse: Codable {
    public let data: AppScreenshotSet
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppScreenshotSet,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppScreenshotSet.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppCustomProductPageLocalization() -> AppCustomProductPageLocalization? {
        included?.compactMap { relationship -> AppCustomProductPageLocalization? in
            guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
            return appCustomProductPageLocalization
        }.first { $0.id == data.relationships?.appCustomProductPageLocalization?.data?.id }
    }

    public func getAppScreenshots() -> [AppScreenshot] {
        guard let appScreenshotIds = data.relationships?.appScreenshots?.data?.map(\.id),
              let appScreenshots = included?.compactMap({ relationship -> AppScreenshot? in
                  guard case let .appScreenshot(appScreenshot) = relationship else { return nil }
                  return appScreenshotIds.contains(appScreenshot.id) ? appScreenshot : nil
              })
        else {
            return []
        }
        return appScreenshots
    }

    public func getAppStoreVersionExperimentTreatmentLocalization() -> AppStoreVersionExperimentTreatmentLocalization? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatmentLocalization? in
            guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
            return appStoreVersionExperimentTreatmentLocalization
        }.first { $0.id == data.relationships?.appStoreVersionExperimentTreatmentLocalization?.data?.id }
    }

    public func getAppStoreVersionLocalization() -> AppStoreVersionLocalization? {
        included?.compactMap { relationship -> AppStoreVersionLocalization? in
            guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
            return appStoreVersionLocalization
        }.first { $0.id == data.relationships?.appStoreVersionLocalization?.data?.id }
    }

    public enum Included: Codable {
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
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
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

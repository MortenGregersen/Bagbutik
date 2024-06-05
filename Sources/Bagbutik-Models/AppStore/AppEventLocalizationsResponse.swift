import Bagbutik_Core
import Foundation

public struct AppEventLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppEventLocalization

    public let data: [AppEventLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppEventLocalization],
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
        data = try container.decode([AppEventLocalization].self, forKey: "data")
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

    public func getAppEvent(for appEventLocalization: AppEventLocalization) -> AppEvent? {
        included?.compactMap { relationship -> AppEvent? in
            guard case let .appEvent(appEvent) = relationship else { return nil }
            return appEvent
        }.first { $0.id == appEventLocalization.relationships?.appEvent?.data?.id }
    }

    public func getAppEventScreenshots(for appEventLocalization: AppEventLocalization) -> [AppEventScreenshot] {
        guard let appEventScreenshotIds = appEventLocalization.relationships?.appEventScreenshots?.data?.map(\.id),
              let appEventScreenshots = included?.compactMap({ relationship -> AppEventScreenshot? in
                  guard case let .appEventScreenshot(appEventScreenshot) = relationship else { return nil }
                  return appEventScreenshotIds.contains(appEventScreenshot.id) ? appEventScreenshot : nil
              })
        else {
            return []
        }
        return appEventScreenshots
    }

    public func getAppEventVideoClips(for appEventLocalization: AppEventLocalization) -> [AppEventVideoClip] {
        guard let appEventVideoClipIds = appEventLocalization.relationships?.appEventVideoClips?.data?.map(\.id),
              let appEventVideoClips = included?.compactMap({ relationship -> AppEventVideoClip? in
                  guard case let .appEventVideoClip(appEventVideoClip) = relationship else { return nil }
                  return appEventVideoClipIds.contains(appEventVideoClip.id) ? appEventVideoClip : nil
              })
        else {
            return []
        }
        return appEventVideoClips
    }

    public enum Included: Codable {
        case appEvent(AppEvent)
        case appEventScreenshot(AppEventScreenshot)
        case appEventVideoClip(AppEventVideoClip)

        public init(from decoder: Decoder) throws {
            if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appEventScreenshot = try? AppEventScreenshot(from: decoder) {
                self = .appEventScreenshot(appEventScreenshot)
            } else if let appEventVideoClip = try? AppEventVideoClip(from: decoder) {
                self = .appEventVideoClip(appEventVideoClip)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .appEventScreenshot(value):
                try value.encode(to: encoder)
            case let .appEventVideoClip(value):
                try value.encode(to: encoder)
            }
        }
    }
}

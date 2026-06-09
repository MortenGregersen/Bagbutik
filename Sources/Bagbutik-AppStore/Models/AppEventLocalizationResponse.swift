import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppEventLocalizationResponse
 The response body for endpoints that create, read, or modify a localized in-app event entry.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appeventlocalizationresponse>
 */
public struct AppEventLocalizationResponse: Codable, Sendable {
    public let data: AppEventLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppEventLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppEventLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppEvent() -> AppEvent? {
        included?.compactMap { relationship -> AppEvent? in
            guard case let .appEvent(appEvent) = relationship else { return nil }
            return appEvent
        }.first { $0.id == data.relationships?.appEvent?.data?.id }
    }

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    public func getAppEventScreenshots() -> [AppEventScreenshot] {
        guard let appEventScreenshotIds = data.relationships?.appEventScreenshots?.data?.map(\.id),
              let appEventScreenshots = included?.compactMap({ relationship -> AppEventScreenshot? in
                  guard case let .appEventScreenshot(appEventScreenshot) = relationship else { return nil }
                  return appEventScreenshotIds.contains(appEventScreenshot.id) ? appEventScreenshot : nil
              })
        else {
            return []
        }
        return appEventScreenshots
    }

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    public func getAppEventVideoClips() -> [AppEventVideoClip] {
        guard let appEventVideoClipIds = data.relationships?.appEventVideoClips?.data?.map(\.id),
              let appEventVideoClips = included?.compactMap({ relationship -> AppEventVideoClip? in
                  guard case let .appEventVideoClip(appEventVideoClip) = relationship else { return nil }
                  return appEventVideoClipIds.contains(appEventVideoClip.id) ? appEventVideoClip : nil
              })
        else {
            return []
        }
        return appEventVideoClips
    }

    public enum Included: Codable, Sendable {
        case appEvent(AppEvent)
        case appEventScreenshot(AppEventScreenshot)
        case appEventVideoClip(AppEventVideoClip)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appEvents":
                self = .appEvent(try AppEvent(from: decoder))
            case "appEventScreenshots":
                self = .appEventScreenshot(try AppEventScreenshot(from: decoder))
            case "appEventVideoClips":
                self = .appEventVideoClip(try AppEventVideoClip(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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

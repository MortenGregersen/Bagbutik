import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # AppClipsResponse

 The response body for endpoints that list App Clips for an app.

 ```
 object AppClipsResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipsresponse>
 */
public struct AppClipsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppClip

    public let data: [AppClip]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppClip],
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
        data = try container.decode([AppClip].self, forKey: "data")
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

    public func getApp(for appClip: AppClip) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appClip.relationships?.app?.data?.id }
    }

    public func getAppClipDefaultExperiences(for appClip: AppClip) -> [AppClipDefaultExperience] {
        guard let appClipDefaultExperienceIds = appClip.relationships?.appClipDefaultExperiences?.data?.map(\.id),
              let appClipDefaultExperiences = included?.compactMap({ relationship -> AppClipDefaultExperience? in
                  guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
                  return appClipDefaultExperienceIds.contains(appClipDefaultExperience.id) ? appClipDefaultExperience : nil
              })
        else {
            return []
        }
        return appClipDefaultExperiences
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case appClipDefaultExperience(AppClipDefaultExperience)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "appClipDefaultExperiences":
                self = .appClipDefaultExperience(try AppClipDefaultExperience(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            }
        }
    }
}

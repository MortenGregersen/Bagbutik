import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipDefaultExperienceResponse
 A response that contains a single Default App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceresponse>
 */
public struct AppClipDefaultExperienceResponse: Codable, Sendable {
    /// The resource data.
    public let data: AppClipDefaultExperience
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipDefaultExperience,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppClipDefaultExperience.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppClip() -> AppClip? {
        included?.compactMap { relationship -> AppClip? in
            guard case let .appClip(appClip) = relationship else { return nil }
            return appClip
        }.first { $0.id == data.relationships?.appClip?.data?.id }
    }

    public func getAppClipAppStoreReviewDetail() -> AppClipAppStoreReviewDetail? {
        included?.compactMap { relationship -> AppClipAppStoreReviewDetail? in
            guard case let .appClipAppStoreReviewDetail(appClipAppStoreReviewDetail) = relationship else { return nil }
            return appClipAppStoreReviewDetail
        }.first { $0.id == data.relationships?.appClipAppStoreReviewDetail?.data?.id }
    }

    public func getAppClipDefaultExperienceLocalizations() -> [AppClipDefaultExperienceLocalization] {
        guard let appClipDefaultExperienceLocalizationIds = data.relationships?.appClipDefaultExperienceLocalizations?.data?.map(\.id),
              let appClipDefaultExperienceLocalizations = included?.compactMap({ relationship -> AppClipDefaultExperienceLocalization? in
                  guard case let .appClipDefaultExperienceLocalization(appClipDefaultExperienceLocalization) = relationship else { return nil }
                  return appClipDefaultExperienceLocalizationIds.contains(appClipDefaultExperienceLocalization.id) ? appClipDefaultExperienceLocalization : nil
              })
        else {
            return []
        }
        return appClipDefaultExperienceLocalizations
    }

    public func getReleaseWithAppStoreVersion() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(releaseWithAppStoreVersion) = relationship else { return nil }
            return releaseWithAppStoreVersion
        }.first { $0.id == data.relationships?.releaseWithAppStoreVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appClip(AppClip)
        case appClipAppStoreReviewDetail(AppClipAppStoreReviewDetail)
        case appClipDefaultExperienceLocalization(AppClipDefaultExperienceLocalization)
        case appStoreVersion(AppStoreVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appClips":
                self = .appClip(try AppClip(from: decoder))
            case "appClipAppStoreReviewDetails":
                self = .appClipAppStoreReviewDetail(try AppClipAppStoreReviewDetail(from: decoder))
            case "appClipDefaultExperienceLocalizations":
                self = .appClipDefaultExperienceLocalization(try AppClipDefaultExperienceLocalization(from: decoder))
            case "appStoreVersions":
                self = .appStoreVersion(try AppStoreVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appClip(value):
                try value.encode(to: encoder)
            case let .appClipAppStoreReviewDetail(value):
                try value.encode(to: encoder)
            case let .appClipDefaultExperienceLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}

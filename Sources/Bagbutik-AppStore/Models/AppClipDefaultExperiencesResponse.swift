import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipDefaultExperiencesResponse
 A response that contains a list of Default App Clip Experiences resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencesresponse>
 */
public struct AppClipDefaultExperiencesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppClipDefaultExperience

    /// The resource data.
    public let data: [AppClipDefaultExperience]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [AppClipDefaultExperience],
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
        data = try container.decode([AppClipDefaultExperience].self, forKey: "data")
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

    public func getAppClip(for appClipDefaultExperience: AppClipDefaultExperience) -> AppClip? {
        included?.compactMap { relationship -> AppClip? in
            guard case let .appClip(appClip) = relationship else { return nil }
            return appClip
        }.first { $0.id == appClipDefaultExperience.relationships?.appClip?.data?.id }
    }

    public func getAppClipAppStoreReviewDetail(for appClipDefaultExperience: AppClipDefaultExperience) -> AppClipAppStoreReviewDetail? {
        included?.compactMap { relationship -> AppClipAppStoreReviewDetail? in
            guard case let .appClipAppStoreReviewDetail(appClipAppStoreReviewDetail) = relationship else { return nil }
            return appClipAppStoreReviewDetail
        }.first { $0.id == appClipDefaultExperience.relationships?.appClipAppStoreReviewDetail?.data?.id }
    }

    public func getAppClipDefaultExperienceLocalizations(for appClipDefaultExperience: AppClipDefaultExperience) -> [AppClipDefaultExperienceLocalization] {
        guard let appClipDefaultExperienceLocalizationIds = appClipDefaultExperience.relationships?.appClipDefaultExperienceLocalizations?.data?.map(\.id),
              let appClipDefaultExperienceLocalizations = included?.compactMap({ relationship -> AppClipDefaultExperienceLocalization? in
                  guard case let .appClipDefaultExperienceLocalization(appClipDefaultExperienceLocalization) = relationship else { return nil }
                  return appClipDefaultExperienceLocalizationIds.contains(appClipDefaultExperienceLocalization.id) ? appClipDefaultExperienceLocalization : nil
              })
        else {
            return []
        }
        return appClipDefaultExperienceLocalizations
    }

    public func getReleaseWithAppStoreVersion(for appClipDefaultExperience: AppClipDefaultExperience) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(releaseWithAppStoreVersion) = relationship else { return nil }
            return releaseWithAppStoreVersion
        }.first { $0.id == appClipDefaultExperience.relationships?.releaseWithAppStoreVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appClip(AppClip)
        case appClipAppStoreReviewDetail(AppClipAppStoreReviewDetail)
        case appClipDefaultExperienceLocalization(AppClipDefaultExperienceLocalization)
        case appStoreVersion(AppStoreVersion)

        public init(from decoder: Decoder) throws {
            if let appClip = try? AppClip(from: decoder) {
                self = .appClip(appClip)
            } else if let appClipAppStoreReviewDetail = try? AppClipAppStoreReviewDetail(from: decoder) {
                self = .appClipAppStoreReviewDetail(appClipAppStoreReviewDetail)
            } else if let appClipDefaultExperienceLocalization = try? AppClipDefaultExperienceLocalization(from: decoder) {
                self = .appClipDefaultExperienceLocalization(appClipDefaultExperienceLocalization)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
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

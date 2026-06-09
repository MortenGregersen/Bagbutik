import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipAdvancedExperiencesResponse
 A response containing a list of configured App Clip advanced experiences.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencesresponse>
 */
public struct AppClipAdvancedExperiencesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppClipAdvancedExperience

    /// The resource data.
    public let data: [AppClipAdvancedExperience]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [AppClipAdvancedExperience],
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
        data = try container.decode([AppClipAdvancedExperience].self, forKey: "data")
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

    public func getAppClip(for appClipAdvancedExperience: AppClipAdvancedExperience) -> AppClip? {
        included?.compactMap { relationship -> AppClip? in
            guard case let .appClip(appClip) = relationship else { return nil }
            return appClip
        }.first { $0.id == appClipAdvancedExperience.relationships?.appClip?.data?.id }
    }

    public func getHeaderImage(for appClipAdvancedExperience: AppClipAdvancedExperience) -> AppClipAdvancedExperienceImage? {
        included?.compactMap { relationship -> AppClipAdvancedExperienceImage? in
            guard case let .appClipAdvancedExperienceImage(headerImage) = relationship else { return nil }
            return headerImage
        }.first { $0.id == appClipAdvancedExperience.relationships?.headerImage?.data?.id }
    }

    public func getLocalizations(for appClipAdvancedExperience: AppClipAdvancedExperience) -> [AppClipAdvancedExperienceLocalization] {
        guard let localizationIds = appClipAdvancedExperience.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> AppClipAdvancedExperienceLocalization? in
                  guard case let .appClipAdvancedExperienceLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public enum Included: Codable, Sendable {
        case appClip(AppClip)
        case appClipAdvancedExperienceImage(AppClipAdvancedExperienceImage)
        case appClipAdvancedExperienceLocalization(AppClipAdvancedExperienceLocalization)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appClips":
                self = .appClip(try AppClip(from: decoder))
            case "appClipAdvancedExperienceImages":
                self = .appClipAdvancedExperienceImage(try AppClipAdvancedExperienceImage(from: decoder))
            case "appClipAdvancedExperienceLocalizations":
                self = .appClipAdvancedExperienceLocalization(try AppClipAdvancedExperienceLocalization(from: decoder))
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
            case let .appClipAdvancedExperienceImage(value):
                try value.encode(to: encoder)
            case let .appClipAdvancedExperienceLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}

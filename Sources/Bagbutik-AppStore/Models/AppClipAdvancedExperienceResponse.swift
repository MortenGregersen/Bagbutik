import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipAdvancedExperienceResponse
 A response that contains a single Advanced App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceresponse>
 */
public struct AppClipAdvancedExperienceResponse: Codable, Sendable {
    /// The resource data.
    public let data: AppClipAdvancedExperience
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipAdvancedExperience,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppClipAdvancedExperience.self, forKey: "data")
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

    public func getHeaderImage() -> AppClipAdvancedExperienceImage? {
        included?.compactMap { relationship -> AppClipAdvancedExperienceImage? in
            guard case let .appClipAdvancedExperienceImage(headerImage) = relationship else { return nil }
            return headerImage
        }.first { $0.id == data.relationships?.headerImage?.data?.id }
    }

    public func getLocalizations() -> [AppClipAdvancedExperienceLocalization] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
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

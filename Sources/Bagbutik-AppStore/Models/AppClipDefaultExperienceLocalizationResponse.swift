import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipDefaultExperienceLocalizationResponse
 The response body for endpoints that create, read, or modify a localized App Clip card subtitle.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationresponse>
 */
public struct AppClipDefaultExperienceLocalizationResponse: Codable, Sendable {
    /// The resource data.
    public let data: AppClipDefaultExperienceLocalization
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipDefaultExperienceLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppClipDefaultExperienceLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppClipDefaultExperience() -> AppClipDefaultExperience? {
        included?.compactMap { relationship -> AppClipDefaultExperience? in
            guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
            return appClipDefaultExperience
        }.first { $0.id == data.relationships?.appClipDefaultExperience?.data?.id }
    }

    public func getAppClipHeaderImage() -> AppClipHeaderImage? {
        included?.compactMap { relationship -> AppClipHeaderImage? in
            guard case let .appClipHeaderImage(appClipHeaderImage) = relationship else { return nil }
            return appClipHeaderImage
        }.first { $0.id == data.relationships?.appClipHeaderImage?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appClipHeaderImage(AppClipHeaderImage)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appClipDefaultExperiences":
                self = .appClipDefaultExperience(try AppClipDefaultExperience(from: decoder))
            case "appClipHeaderImages":
                self = .appClipHeaderImage(try AppClipHeaderImage(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            case let .appClipHeaderImage(value):
                try value.encode(to: encoder)
            }
        }
    }
}

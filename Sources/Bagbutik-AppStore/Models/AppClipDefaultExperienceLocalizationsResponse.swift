import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipDefaultExperienceLocalizationsResponse
 A response that contains a list of Default App Clip Experience Localizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationsresponse>
 */
public struct AppClipDefaultExperienceLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppClipDefaultExperienceLocalization

    /// The resource data.
    public let data: [AppClipDefaultExperienceLocalization]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [AppClipDefaultExperienceLocalization],
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
        data = try container.decode([AppClipDefaultExperienceLocalization].self, forKey: "data")
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

    public func getAppClipDefaultExperience(for appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization) -> AppClipDefaultExperience? {
        included?.compactMap { relationship -> AppClipDefaultExperience? in
            guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
            return appClipDefaultExperience
        }.first { $0.id == appClipDefaultExperienceLocalization.relationships?.appClipDefaultExperience?.data?.id }
    }

    public func getAppClipHeaderImage(for appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization) -> AppClipHeaderImage? {
        included?.compactMap { relationship -> AppClipHeaderImage? in
            guard case let .appClipHeaderImage(appClipHeaderImage) = relationship else { return nil }
            return appClipHeaderImage
        }.first { $0.id == appClipDefaultExperienceLocalization.relationships?.appClipHeaderImage?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appClipHeaderImage(AppClipHeaderImage)

        public init(from decoder: Decoder) throws {
            if let appClipDefaultExperience = try? AppClipDefaultExperience(from: decoder) {
                self = .appClipDefaultExperience(appClipDefaultExperience)
            } else if let appClipHeaderImage = try? AppClipHeaderImage(from: decoder) {
                self = .appClipHeaderImage(appClipHeaderImage)
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
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            case let .appClipHeaderImage(value):
                try value.encode(to: encoder)
            }
        }
    }
}

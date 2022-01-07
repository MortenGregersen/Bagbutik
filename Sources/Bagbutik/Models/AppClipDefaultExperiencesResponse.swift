import Foundation

/**
 A response that contains a list of Default App Clip Experiences resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencesresponse>
 */
public struct AppClipDefaultExperiencesResponse: Codable, PagedResponse {
    public typealias Data = AppClipDefaultExperience
    /// The resource data.
    public let data: [AppClipDefaultExperience]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppClipDefaultExperience], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
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
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

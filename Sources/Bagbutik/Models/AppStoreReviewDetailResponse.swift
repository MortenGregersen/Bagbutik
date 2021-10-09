import Foundation

/**
 A response that contains a single App Store Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailresponse>
 */
public struct AppStoreReviewDetailResponse: Codable {
    /// The resource data.
    public let data: AppStoreReviewDetail
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreReviewDetail, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appStoreReviewAttachment(AppStoreReviewAttachment)
        case appStoreVersion(AppStoreVersion)

        public init(from decoder: Decoder) throws {
            if let appStoreReviewAttachment = try? AppStoreReviewAttachment(from: decoder) {
                self = .appStoreReviewAttachment(appStoreReviewAttachment)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreReviewAttachment(value):
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

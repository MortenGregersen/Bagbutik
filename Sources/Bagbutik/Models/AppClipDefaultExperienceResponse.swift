import Foundation

public struct AppClipDefaultExperienceResponse: Codable {
    public let data: AppClipDefaultExperience
    public let included: [Included]?
    public let links: DocumentLinks

    public init(data: AppClipDefaultExperience, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
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

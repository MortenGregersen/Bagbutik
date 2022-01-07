import Foundation

/**
 A response that contains a single Advanced App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceresponse>
 */
public struct AppClipAdvancedExperienceResponse: Codable {
    /// The resource data.
    public let data: AppClipAdvancedExperience
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipAdvancedExperience, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appClip(AppClip)
        case appClipAdvancedExperienceImage(AppClipAdvancedExperienceImage)
        case appClipAdvancedExperienceLocalization(AppClipAdvancedExperienceLocalization)

        public init(from decoder: Decoder) throws {
            if let appClip = try? AppClip(from: decoder) {
                self = .appClip(appClip)
            } else if let appClipAdvancedExperienceImage = try? AppClipAdvancedExperienceImage(from: decoder) {
                self = .appClipAdvancedExperienceImage(appClipAdvancedExperienceImage)
            } else if let appClipAdvancedExperienceLocalization = try? AppClipAdvancedExperienceLocalization(from: decoder) {
                self = .appClipAdvancedExperienceLocalization(appClipAdvancedExperienceLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

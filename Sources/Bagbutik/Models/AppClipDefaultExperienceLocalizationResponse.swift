import Foundation

public struct AppClipDefaultExperienceLocalizationResponse: Codable {
    public let data: AppClipDefaultExperienceLocalization
    public let included: [Included]?
    public let links: DocumentLinks

    public init(data: AppClipDefaultExperienceLocalization, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appClipHeaderImage(AppClipHeaderImage)

        public init(from decoder: Decoder) throws {
            if let appClipDefaultExperience = try? AppClipDefaultExperience(from: decoder) {
                self = .appClipDefaultExperience(appClipDefaultExperience)
            } else if let appClipHeaderImage = try? AppClipHeaderImage(from: decoder) {
                self = .appClipHeaderImage(appClipHeaderImage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

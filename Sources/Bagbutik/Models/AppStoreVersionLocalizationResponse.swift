import Foundation

public struct AppStoreVersionLocalizationResponse: Codable {
    public let data: AppStoreVersionLocalization
    public let included: [Included]?
    public let links: DocumentLinks

    public init(data: AppStoreVersionLocalization, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appScreenshotSets(AppScreenshotSet)
        case appPreviewSets(AppPreviewSet)

        public init(from decoder: Decoder) throws {
            if let appScreenshotSets = try? AppScreenshotSet(from: decoder) {
                self = .appScreenshotSets(appScreenshotSets)
            } else if let appPreviewSets = try? AppPreviewSet(from: decoder) {
                self = .appPreviewSets(appPreviewSets)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appScreenshotSets(value):
                try value.encode(to: encoder)
            case let .appPreviewSets(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appScreenshotSets
            case appPreviewSets
        }
    }
}

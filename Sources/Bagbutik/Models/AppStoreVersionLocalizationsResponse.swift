import Foundation

public struct AppStoreVersionLocalizationsResponse: Codable {
    public let data: [AppStoreVersionLocalization]
    public let included: [Included]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppStoreVersionLocalization], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appPreviewSets(AppPreviewSet)
        case appScreenshotSets(AppScreenshotSet)

        public init(from decoder: Decoder) throws {
            if let appPreviewSets = try? AppPreviewSet(from: decoder) {
                self = .appPreviewSets(appPreviewSets)
            } else if let appScreenshotSets = try? AppScreenshotSet(from: decoder) {
                self = .appScreenshotSets(appScreenshotSets)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appPreviewSets(value):
                try value.encode(to: encoder)
            case let .appScreenshotSets(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appPreviewSets
            case appScreenshotSets
        }
    }
}

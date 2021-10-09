import Foundation

/**
 A response that contains a list of App Screenshot Set resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsetsresponse>
 */
public struct AppScreenshotSetsResponse: Codable, PagedResponse {
    public typealias Data = AppScreenshotSet
    /// The resource data.
    public let data: [AppScreenshotSet]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppScreenshotSet], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appScreenshot(AppScreenshot)
        case appStoreVersionLocalization(AppStoreVersionLocalization)

        public init(from decoder: Decoder) throws {
            if let appScreenshot = try? AppScreenshot(from: decoder) {
                self = .appScreenshot(appScreenshot)
            } else if let appStoreVersionLocalization = try? AppStoreVersionLocalization(from: decoder) {
                self = .appStoreVersionLocalization(appStoreVersionLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appScreenshot(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalization(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appScreenshot
            case appStoreVersionLocalization
        }
    }
}

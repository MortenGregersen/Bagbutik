import Foundation

public struct AppEventLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppEventLocalization
    /// The resource data.
    public let data: [AppEventLocalization]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppEventLocalization], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appEvent(AppEvent)
        case appEventScreenshot(AppEventScreenshot)
        case appEventVideoClip(AppEventVideoClip)

        public init(from decoder: Decoder) throws {
            if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appEventScreenshot = try? AppEventScreenshot(from: decoder) {
                self = .appEventScreenshot(appEventScreenshot)
            } else if let appEventVideoClip = try? AppEventVideoClip(from: decoder) {
                self = .appEventVideoClip(appEventVideoClip)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .appEventScreenshot(value):
                try value.encode(to: encoder)
            case let .appEventVideoClip(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

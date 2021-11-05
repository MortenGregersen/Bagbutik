import Foundation

/**
 A response that contains a list of App Clips resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipsresponse>
 */
public struct AppClipsResponse: Codable, PagedResponse {
    public typealias Data = AppClip
    /// The resource data.
    public let data: [AppClip]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppClip], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case app(App)
        case appClipDefaultExperience(AppClipDefaultExperience)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appClipDefaultExperience = try? AppClipDefaultExperience(from: decoder) {
                self = .appClipDefaultExperience(appClipDefaultExperience)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

import Foundation

/**
 A response that contains a list of Bundle ID resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidsresponse>
 */
public struct BundleIdsResponse: Codable, PagedResponse {
    public typealias Data = BundleId
    /// The resource data.
    public let data: [BundleId]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BundleId], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case app(App)
        case bundleIdCapability(BundleIdCapability)
        case profile(Profile)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let bundleIdCapability = try? BundleIdCapability(from: decoder) {
                self = .bundleIdCapability(bundleIdCapability)
            } else if let profile = try? Profile(from: decoder) {
                self = .profile(profile)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .bundleIdCapability(value):
                try value.encode(to: encoder)
            case let .profile(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

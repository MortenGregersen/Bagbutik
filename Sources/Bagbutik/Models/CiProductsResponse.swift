import Foundation

/**
 A response that contains a list of Products resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproductsresponse>
 */
public struct CiProductsResponse: Codable, PagedResponse {
    public typealias Data = CiProduct
    /// The resource data.
    public let data: [CiProduct]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [CiProduct], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case app(App)
        case bundleId(BundleId)
        case scmRepository(ScmRepository)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let bundleId = try? BundleId(from: decoder) {
                self = .bundleId(bundleId)
            } else if let scmRepository = try? ScmRepository(from: decoder) {
                self = .scmRepository(scmRepository)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .bundleId(value):
                try value.encode(to: encoder)
            case let .scmRepository(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

import Foundation

/**
 A response that contains a single Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproductresponse>
 */
public struct CiProductResponse: Codable {
    /// The resource data.
    public let data: CiProduct
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiProduct, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
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

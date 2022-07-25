import Foundation

/**
 A response that contains a single Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproductresponse>
 */
public struct CiProductResponse: Codable {
    /// The resource data.
    public let data: CiProduct
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiProduct, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getBundleId() -> BundleId? {
        included?.compactMap { relationship -> BundleId? in
            guard case let .bundleId(bundleId) = relationship else { return nil }
            return bundleId
        }.first { $0.id == data.relationships?.bundleId?.data?.id }
    }

    public func getPrimaryRepositories() -> [ScmRepository] {
        guard let primaryRepositoryIds = data.relationships?.primaryRepositories?.data?.map(\.id),
              let primaryRepositories = included?.compactMap({ relationship -> ScmRepository? in
                  guard case let .scmRepository(primaryRepository) = relationship else { return nil }
                  return primaryRepositoryIds.contains(primaryRepository.id) ? primaryRepository : nil
              })
        else {
            return []
        }
        return primaryRepositories
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

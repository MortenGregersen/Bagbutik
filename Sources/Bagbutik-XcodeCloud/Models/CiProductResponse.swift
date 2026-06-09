import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiProductResponse
 A response that contains a single Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproductresponse>
 */
public struct CiProductResponse: Codable, Sendable {
    /// The resource data.
    public let data: CiProduct
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiProduct,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiProduct.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
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

    public enum Included: Codable, Sendable {
        case app(App)
        case bundleId(BundleId)
        case scmRepository(ScmRepository)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "bundleIds":
                self = .bundleId(try BundleId(from: decoder))
            case "scmRepositories":
                self = .scmRepository(try ScmRepository(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
    }
}

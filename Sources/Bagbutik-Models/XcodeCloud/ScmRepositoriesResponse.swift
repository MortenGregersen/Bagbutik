import Bagbutik_Core
import Foundation

/**
 # ScmRepositoriesResponse
 A response that contains a list of Repositories resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmrepositoriesresponse>
 */
public struct ScmRepositoriesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = ScmRepository

    /// The resource data.
    public let data: [ScmRepository]
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [ScmRepository],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([ScmRepository].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getDefaultBranch(for scmRepository: ScmRepository) -> ScmGitReference? {
        included?.compactMap { relationship -> ScmGitReference? in
            guard case let .scmGitReference(defaultBranch) = relationship else { return nil }
            return defaultBranch
        }.first { $0.id == scmRepository.relationships?.defaultBranch?.data?.id }
    }

    public func getScmProvider(for scmRepository: ScmRepository) -> ScmProvider? {
        included?.compactMap { relationship -> ScmProvider? in
            guard case let .scmProvider(scmProvider) = relationship else { return nil }
            return scmProvider
        }.first { $0.id == scmRepository.relationships?.scmProvider?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case scmGitReference(ScmGitReference)
        case scmProvider(ScmProvider)

        public init(from decoder: Decoder) throws {
            if let scmGitReference = try? ScmGitReference(from: decoder) {
                self = .scmGitReference(scmGitReference)
            } else if let scmProvider = try? ScmProvider(from: decoder) {
                self = .scmProvider(scmProvider)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .scmGitReference(value):
                try value.encode(to: encoder)
            case let .scmProvider(value):
                try value.encode(to: encoder)
            }
        }
    }
}

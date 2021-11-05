import Foundation

/**
 A response that contains a list of Repositories resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmrepositoriesresponse>
 */
public struct ScmRepositoriesResponse: Codable, PagedResponse {
    public typealias Data = ScmRepository
    /// The resource data.
    public let data: [ScmRepository]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [ScmRepository], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}

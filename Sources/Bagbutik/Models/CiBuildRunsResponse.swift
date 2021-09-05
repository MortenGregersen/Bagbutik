import Foundation

/**
 A response that contains a list of Build Runs resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrunsresponse>
 */
public struct CiBuildRunsResponse: Codable, PagedResponse {
    public typealias Data = CiBuildRun
    /// The resource data.
    public let data: [CiBuildRun]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [CiBuildRun], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case builds(Build)
        case destinationBranch(ScmGitReference)
        case product(CiProduct)
        case pullRequest(ScmPullRequest)
        case sourceBranchOrTag(ScmGitReference)
        case workflow(CiWorkflow)

        public init(from decoder: Decoder) throws {
            if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else if let destinationBranch = try? ScmGitReference(from: decoder) {
                self = .destinationBranch(destinationBranch)
            } else if let product = try? CiProduct(from: decoder) {
                self = .product(product)
            } else if let pullRequest = try? ScmPullRequest(from: decoder) {
                self = .pullRequest(pullRequest)
            } else if let sourceBranchOrTag = try? ScmGitReference(from: decoder) {
                self = .sourceBranchOrTag(sourceBranchOrTag)
            } else if let workflow = try? CiWorkflow(from: decoder) {
                self = .workflow(workflow)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .builds(value):
                try value.encode(to: encoder)
            case let .destinationBranch(value):
                try value.encode(to: encoder)
            case let .product(value):
                try value.encode(to: encoder)
            case let .pullRequest(value):
                try value.encode(to: encoder)
            case let .sourceBranchOrTag(value):
                try value.encode(to: encoder)
            case let .workflow(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case builds
            case destinationBranch
            case product
            case pullRequest
            case sourceBranchOrTag
            case workflow
        }
    }
}

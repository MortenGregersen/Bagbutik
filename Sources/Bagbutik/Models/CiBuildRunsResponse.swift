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
        case build(Build)
        case ciProduct(CiProduct)
        case ciWorkflow(CiWorkflow)
        case scmGitReference(ScmGitReference)
        case scmPullRequest(ScmPullRequest)

        public init(from decoder: Decoder) throws {
            if let build = try? Build(from: decoder) {
                self = .build(build)
            } else if let ciProduct = try? CiProduct(from: decoder) {
                self = .ciProduct(ciProduct)
            } else if let ciWorkflow = try? CiWorkflow(from: decoder) {
                self = .ciWorkflow(ciWorkflow)
            } else if let scmGitReference = try? ScmGitReference(from: decoder) {
                self = .scmGitReference(scmGitReference)
            } else if let scmPullRequest = try? ScmPullRequest(from: decoder) {
                self = .scmPullRequest(scmPullRequest)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .build(value):
                try value.encode(to: encoder)
            case let .ciProduct(value):
                try value.encode(to: encoder)
            case let .ciWorkflow(value):
                try value.encode(to: encoder)
            case let .scmGitReference(value):
                try value.encode(to: encoder)
            case let .scmPullRequest(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case build
            case ciProduct
            case ciWorkflow
            case scmGitReference
            case scmPullRequest
        }
    }
}

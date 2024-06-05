import Bagbutik_Core
import Foundation

/**
 # CiBuildRunResponse
 A response that contains a single Build Runs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrunresponse>
 */
public struct CiBuildRunResponse: Codable {
    /// The resource data.
    public let data: CiBuildRun
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiBuildRun,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiBuildRun.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getBuilds() -> [Build] {
        guard let buildIds = data.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public func getDestinationBranch() -> ScmGitReference? {
        included?.compactMap { relationship -> ScmGitReference? in
            guard case let .scmGitReference(destinationBranch) = relationship else { return nil }
            return destinationBranch
        }.first { $0.id == data.relationships?.destinationBranch?.data?.id }
    }

    public func getProduct() -> CiProduct? {
        included?.compactMap { relationship -> CiProduct? in
            guard case let .ciProduct(product) = relationship else { return nil }
            return product
        }.first { $0.id == data.relationships?.product?.data?.id }
    }

    public func getPullRequest() -> ScmPullRequest? {
        included?.compactMap { relationship -> ScmPullRequest? in
            guard case let .scmPullRequest(pullRequest) = relationship else { return nil }
            return pullRequest
        }.first { $0.id == data.relationships?.pullRequest?.data?.id }
    }

    public func getSourceBranchOrTag() -> ScmGitReference? {
        included?.compactMap { relationship -> ScmGitReference? in
            guard case let .scmGitReference(sourceBranchOrTag) = relationship else { return nil }
            return sourceBranchOrTag
        }.first { $0.id == data.relationships?.sourceBranchOrTag?.data?.id }
    }

    public func getWorkflow() -> CiWorkflow? {
        included?.compactMap { relationship -> CiWorkflow? in
            guard case let .ciWorkflow(workflow) = relationship else { return nil }
            return workflow
        }.first { $0.id == data.relationships?.workflow?.data?.id }
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
    }
}

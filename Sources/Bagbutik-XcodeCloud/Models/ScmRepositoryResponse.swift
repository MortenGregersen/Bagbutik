import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # ScmRepositoryResponse
 The response body for endpoints that read a single SCM repository connected to Xcode Cloud.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmrepositoryresponse>
 */
public struct ScmRepositoryResponse: Codable, Sendable {
    /// The resource data.
    public let data: ScmRepository
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmRepository,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(ScmRepository.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getDefaultBranch() -> ScmGitReference? {
        included?.compactMap { relationship -> ScmGitReference? in
            guard case let .scmGitReference(defaultBranch) = relationship else { return nil }
            return defaultBranch
        }.first { $0.id == data.relationships?.defaultBranch?.data?.id }
    }

    public func getScmProvider() -> ScmProvider? {
        included?.compactMap { relationship -> ScmProvider? in
            guard case let .scmProvider(scmProvider) = relationship else { return nil }
            return scmProvider
        }.first { $0.id == data.relationships?.scmProvider?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case scmGitReference(ScmGitReference)
        case scmProvider(ScmProvider)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "scmGitReferences":
                self = .scmGitReference(try ScmGitReference(from: decoder))
            case "scmProviders":
                self = .scmProvider(try ScmProvider(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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

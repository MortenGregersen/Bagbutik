import Bagbutik_Core
import Foundation

/**
 # ScmPullRequestResponse
 A response that contains a single Pull Requests resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequestresponse>
 */
public struct ScmPullRequestResponse: Codable, Sendable {
    /// The resource data.
    public let data: ScmPullRequest
    /// The requested relationship data.
    public var included: [ScmRepository]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmPullRequest,
                included: [ScmRepository]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(ScmPullRequest.self, forKey: "data")
        included = try container.decodeIfPresent([ScmRepository].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}

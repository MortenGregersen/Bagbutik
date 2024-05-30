import Bagbutik_Core
import Foundation

/**
 # ScmPullRequestsResponse
 A response that contains a list of Pull Requests resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequestsresponse>
 */
public struct ScmPullRequestsResponse: Codable, PagedResponse {
    public typealias Data = ScmPullRequest

    /// The resource data.
    public let data: [ScmPullRequest]
    /// The requested relationship data.
    public var included: [ScmRepository]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [ScmPullRequest],
                included: [ScmRepository]? = nil,
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
        data = try container.decode([ScmPullRequest].self, forKey: "data")
        included = try container.decodeIfPresent([ScmRepository].self, forKey: "included")
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
}

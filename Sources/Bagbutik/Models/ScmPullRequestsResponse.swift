import Foundation

/**
 A response that contains a list of Pull Requests resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequestsresponse>
 */
public struct ScmPullRequestsResponse: Codable, PagedResponse {
    public typealias Data = ScmPullRequest
    /// The resource data.
    public let data: [ScmPullRequest]
    /// The included related resources.
    public let included: [ScmRepository]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [ScmPullRequest], included: [ScmRepository]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

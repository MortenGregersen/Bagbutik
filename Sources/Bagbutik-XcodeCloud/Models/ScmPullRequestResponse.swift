import Bagbutik_Core
import Foundation

/**
 # ScmPullRequestResponse
 A response that contains a single Pull Requests resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequestresponse>
 */
public struct ScmPullRequestResponse: Codable {
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
}

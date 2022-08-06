import Bagbutik_Core
import Foundation

/**
 # ScmGitReferencesResponse
 A response that contains a list of Git References resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreferencesresponse>
 */
public struct ScmGitReferencesResponse: Codable, PagedResponse {
    public typealias Data = ScmGitReference

    /// The resource data.
    public let data: [ScmGitReference]
    /// The requested relationship data.
    public var included: [ScmRepository]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [ScmGitReference],
                included: [ScmRepository]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

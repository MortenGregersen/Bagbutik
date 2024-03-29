import Bagbutik_Core
import Foundation

/**
 # ScmProvidersResponse
 A response that contains a list of Providers resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovidersresponse>
 */
public struct ScmProvidersResponse: Codable, PagedResponse {
    public typealias Data = ScmProvider

    /// The resource data.
    public let data: [ScmProvider]
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [ScmProvider],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

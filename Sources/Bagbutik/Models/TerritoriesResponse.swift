import Foundation

/**
 A response that contains a list of Territory resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoriesresponse>
 */
public struct TerritoriesResponse: Codable {
    /// The resource data.
    public let data: [Territory]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Territory], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

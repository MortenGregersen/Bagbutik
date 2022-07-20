import Foundation

/**
 A response that contains a list of Build Actions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildactionsresponse>
 */
public struct CiBuildActionsResponse: Codable, PagedResponse {
    public typealias Data = CiBuildAction
    /// The resource data.
    public let data: [CiBuildAction]
    /// The requested relationship data.
    public var included: [CiBuildRun]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiBuildAction], included: [CiBuildRun]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

import Foundation

/**
 A response that contains a list of App Price Point resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricepointsresponse>
 */
public struct AppPricePointsResponse: Codable, PagedResponse {
    public typealias Data = AppPricePoint
    /// The resource data.
    public let data: [AppPricePoint]
    /// The included related resources.
    public let included: [Territory]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppPricePoint], included: [Territory]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

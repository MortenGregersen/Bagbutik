import Foundation

/// A response that contains a list of App Price Point resources.
public struct AppPricePointsResponse: Codable {
    /// The resource data.
    public let data: [AppPricePoint]
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

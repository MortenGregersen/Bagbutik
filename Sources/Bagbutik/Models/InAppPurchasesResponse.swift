import Foundation

/// A response that contains a list of In-App Purchase resources.
public struct InAppPurchasesResponse: Codable {
    /// The resource data.
    public let data: [InAppPurchase]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [InAppPurchase], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

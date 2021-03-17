import Foundation

/**
 A response that contains a list of App Price Tier resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricetiersresponse>
 */
public struct AppPriceTiersResponse: Codable {
    /// The resource data.
    public let data: [AppPriceTier]
    public let included: [AppPricePoint]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppPriceTier], included: [AppPricePoint]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

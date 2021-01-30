import Foundation

public struct AppPriceTiersResponse: Codable {
    public let data: [AppPriceTier]
    public let included: [AppPricePoint]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppPriceTier], included: [AppPricePoint]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

import Foundation

public struct AppPricePointsResponse: Codable {
    public let data: [AppPricePoint]
    public let included: [Territory]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppPricePoint], included: [Territory]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

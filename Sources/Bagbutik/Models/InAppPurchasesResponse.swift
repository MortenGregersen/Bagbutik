import Foundation

public struct InAppPurchasesResponse: Codable {
    public let data: [InAppPurchase]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [InAppPurchase], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

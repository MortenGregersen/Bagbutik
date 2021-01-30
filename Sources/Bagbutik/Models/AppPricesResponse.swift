import Foundation

public struct AppPricesResponse: Codable {
    public let data: [AppPrice]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppPrice], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

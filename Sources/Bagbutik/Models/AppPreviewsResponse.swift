import Foundation

public struct AppPreviewsResponse: Codable {
    public let data: [AppPreview]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppPreview], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

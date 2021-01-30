import Foundation

public struct AppScreenshotsResponse: Codable {
    public let data: [AppScreenshot]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppScreenshot], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

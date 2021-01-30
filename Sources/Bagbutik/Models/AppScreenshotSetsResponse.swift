import Foundation

public struct AppScreenshotSetsResponse: Codable {
    public let data: [AppScreenshotSet]
    public let included: [AppScreenshot]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppScreenshotSet], included: [AppScreenshot]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

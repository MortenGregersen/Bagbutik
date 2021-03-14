import Foundation

/// A response that contains a list of App Screenshot Set resources.
public struct AppScreenshotSetsResponse: Codable {
    /// The resource data.
    public let data: [AppScreenshotSet]
    public let included: [AppScreenshot]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppScreenshotSet], included: [AppScreenshot]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

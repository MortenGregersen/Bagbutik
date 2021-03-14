import Foundation

/// A response that contains a list of App Screenshots resources.
public struct AppScreenshotsResponse: Codable {
    /// The resource data.
    public let data: [AppScreenshot]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppScreenshot], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

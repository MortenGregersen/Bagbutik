import Foundation

/**
 A response that contains a list of App Screenshots resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsresponse>
 */
public struct AppScreenshotsResponse: Codable, PagedResponse {
    public typealias Data = AppScreenshot
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

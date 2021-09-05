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
    /// The included related resources.
    public let included: [AppScreenshotSet]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppScreenshot], included: [AppScreenshotSet]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

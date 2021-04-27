import Foundation

/**
 A response that contains a list of App Screenshot Set resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsetsresponse>
 */
public struct AppScreenshotSetsResponse: Codable {
    /// The resource data.
    public let data: [AppScreenshotSet]
    /// The included related resources.
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

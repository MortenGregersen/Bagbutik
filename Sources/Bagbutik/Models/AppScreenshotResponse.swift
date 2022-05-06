import Foundation

/**
 A response that contains a single App Screenshots resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotresponse>
 */
public struct AppScreenshotResponse: Codable {
    /// The resource data.
    public let data: AppScreenshot
    /// The included related resources.
    public var included: [AppScreenshotSet]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppScreenshot, included: [AppScreenshotSet]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}

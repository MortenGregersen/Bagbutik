import Foundation

/**
 A response that contains a single App Screenshot Sets resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsetresponse>
 */
public struct AppScreenshotSetResponse: Codable {
    /// The resource data.
    public let data: AppScreenshotSet
    public let included: [AppScreenshot]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppScreenshotSet, included: [AppScreenshot]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}

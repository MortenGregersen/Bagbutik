import Foundation

/**
 A response that contains a single App Screenshots resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotresponse>
 */
public struct AppScreenshotResponse: Codable {
    public let data: AppScreenshot
    public var included: [AppScreenshotSet]?
    public let links: DocumentLinks

    public init(data: AppScreenshot, included: [AppScreenshotSet]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}

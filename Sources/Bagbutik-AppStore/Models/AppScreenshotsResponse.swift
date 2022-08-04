import Foundation
import Bagbutik_Core

/**
 # AppScreenshotsResponse
 A response that contains a list of App Screenshots resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsresponse>
 */
public struct AppScreenshotsResponse: Codable, PagedResponse {
    public typealias Data = AppScreenshot

    public let data: [AppScreenshot]
    public var included: [AppScreenshotSet]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppScreenshot],
                included: [AppScreenshotSet]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

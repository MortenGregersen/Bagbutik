import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportsResponse
 A response that contains a list of analytics report resources.

 Use this object with [Read reports for a specific request](https://developer.apple.com/documentation/appstoreconnectapi/read_reports_for_a_specific_request).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportsresponse>
 */
public struct AnalyticsReportsResponse: Codable, PagedResponse {
    public typealias Data = AnalyticsReport

    public let data: [AnalyticsReport]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AnalyticsReport],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

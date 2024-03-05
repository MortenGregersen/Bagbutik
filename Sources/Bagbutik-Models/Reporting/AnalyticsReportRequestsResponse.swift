import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportRequestsResponse
 A response that contains a list of analytics report request resources.

 Use this object with [Read report requests](https://developer.apple.com/documentation/appstoreconnectapi/read_report_requests).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestsresponse>
 */
public struct AnalyticsReportRequestsResponse: Codable, PagedResponse {
    public typealias Data = AnalyticsReportRequest

    public let data: [AnalyticsReportRequest]
    public var included: [AnalyticsReport]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AnalyticsReportRequest],
                included: [AnalyticsReport]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}

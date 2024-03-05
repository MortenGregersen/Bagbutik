import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportRequestResponse
 A response that contains a single analytics report request resource.

 Use this object with [Read report request information](https://developer.apple.com/documentation/appstoreconnectapi/read_report_request_information).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestresponse>
 */
public struct AnalyticsReportRequestResponse: Codable {
    public let data: AnalyticsReportRequest
    public var included: [AnalyticsReport]?
    public let links: DocumentLinks

    public init(data: AnalyticsReportRequest,
                included: [AnalyticsReport]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}

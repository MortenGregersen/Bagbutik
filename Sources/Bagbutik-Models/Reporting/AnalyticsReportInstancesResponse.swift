import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportInstancesResponse
 A response that contains a list of analytics report instance resources.

 Use this object with [Read a list of instances of a report](https://developer.apple.com/documentation/appstoreconnectapi/read_a_list_of_instances_of_a_report).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportinstancesresponse>
 */
public struct AnalyticsReportInstancesResponse: Codable, PagedResponse {
    public typealias Data = AnalyticsReportInstance

    public let data: [AnalyticsReportInstance]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AnalyticsReportInstance],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}

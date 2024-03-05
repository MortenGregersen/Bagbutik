import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportInstanceResponse
 A response that contains a single analytics report instance resource.

 Use this object with [Read report instance information](https://developer.apple.com/documentation/appstoreconnectapi/read_report_instance_information).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportinstanceresponse>
 */
public struct AnalyticsReportInstanceResponse: Codable {
    public let data: AnalyticsReportInstance
    public let links: DocumentLinks

    public init(data: AnalyticsReportInstance,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}

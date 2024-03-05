import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportSegmentResponse
 A response that contains a single analytics report segment resource.

 Use this object with [Read the details for a report segment](https://developer.apple.com/documentation/appstoreconnectapi/read_the_details_for_a_report_segment).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportsegmentresponse>
 */
public struct AnalyticsReportSegmentResponse: Codable {
    public let data: AnalyticsReportSegment
    public let links: DocumentLinks

    public init(data: AnalyticsReportSegment,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}

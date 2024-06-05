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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AnalyticsReportSegment.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}

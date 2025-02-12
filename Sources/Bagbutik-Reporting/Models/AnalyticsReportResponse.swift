import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AnalyticsReportResponse
 A response that contains a single analytics report resource.

 Use this object with [Read report information](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsreports-_id_).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportresponse>
 */
public struct AnalyticsReportResponse: Codable, Sendable {
    public let data: AnalyticsReport
    public let links: DocumentLinks

    public init(data: AnalyticsReport,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AnalyticsReport.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}

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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AnalyticsReportInstance.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}

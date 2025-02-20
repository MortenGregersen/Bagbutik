import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AnalyticsReportRequestResponse
 A response that contains a single analytics report request resource.

 Use this object with [Read report request information](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsreportrequests-_id_).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestresponse>
 */
public struct AnalyticsReportRequestResponse: Codable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AnalyticsReportRequest.self, forKey: "data")
        included = try container.decodeIfPresent([AnalyticsReport].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}

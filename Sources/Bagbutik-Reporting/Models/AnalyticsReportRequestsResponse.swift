import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AnalyticsReportRequestsResponse
 A response that contains a list of analytics report request resources.

 Use this object with [Read report requests](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-analyticsreportrequests).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestsresponse>
 */
public struct AnalyticsReportRequestsResponse: Codable, Sendable, PagedResponse {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AnalyticsReportRequest].self, forKey: "data")
        included = try container.decodeIfPresent([AnalyticsReport].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}

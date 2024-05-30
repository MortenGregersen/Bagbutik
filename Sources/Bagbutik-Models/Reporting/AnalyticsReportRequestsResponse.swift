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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([AnalyticsReportRequest].self, forKey: .data)
        included = try container.decodeIfPresent([AnalyticsReport].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }
}

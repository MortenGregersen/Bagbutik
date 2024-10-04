import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportsResponse
 A response that contains a list of analytics report resources.

 Use this object with [Read reports for a specific request](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsreportrequests-_id_-reports).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportsresponse>
 */
public struct AnalyticsReportsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AnalyticsReport

    public let data: [AnalyticsReport]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AnalyticsReport],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AnalyticsReport].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}

import Bagbutik_Core
import Foundation

/**
 # CiTestResultsResponse
 A response that contains a list of Test Results resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestresultsresponse>
 */
public struct CiTestResultsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CiTestResult

    /// The resource data.
    public let data: [CiTestResult]
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiTestResult],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([CiTestResult].self, forKey: "data")
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

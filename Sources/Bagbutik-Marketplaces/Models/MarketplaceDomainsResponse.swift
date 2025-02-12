import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # MarketplaceDomainsResponse
 A response that contains a list of alternative marketplace domain resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacedomainsresponse>
 */
public struct MarketplaceDomainsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = MarketplaceDomain

    public let data: [MarketplaceDomain]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [MarketplaceDomain],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([MarketplaceDomain].self, forKey: "data")
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

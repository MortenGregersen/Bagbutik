import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhooksResponse
 A response that contains a list of a marketplace webhook resources.

 Use this object with [Read marketplace webhook information](https://developer.apple.com/documentation/appstoreconnectapi/read_marketplace_webhook_information).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhooksresponse>
 */
public struct MarketplaceWebhooksResponse: Codable, PagedResponse {
    public typealias Data = MarketplaceWebhook

    public let data: [MarketplaceWebhook]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [MarketplaceWebhook],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([MarketplaceWebhook].self, forKey: "data")
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

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
}

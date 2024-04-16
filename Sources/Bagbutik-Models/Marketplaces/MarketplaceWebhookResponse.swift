import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhookResponse
 A response that contains a single marketplace webhook resource.

 Use this object with [Add a marketplace webhook configuration](https://developer.apple.com/documentation/appstoreconnectapi/add_a_marketplace_webhook_configuration).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookresponse>
 */
public struct MarketplaceWebhookResponse: Codable {
    public let data: MarketplaceWebhook
    public let links: DocumentLinks

    public init(data: MarketplaceWebhook,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}

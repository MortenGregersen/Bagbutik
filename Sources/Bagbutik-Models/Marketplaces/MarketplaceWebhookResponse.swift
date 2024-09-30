import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhookResponse
 A response that contains a single marketplace webhook resource.

 Use this object with [Add a marketplace webhook configuration](https://developer.apple.com/documentation/appstoreconnectapi/add_a_marketplace_webhook_configuration).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookresponse>
 */
public struct MarketplaceWebhookResponse: Codable, Sendable {
    public let data: MarketplaceWebhook
    public let links: DocumentLinks

    public init(data: MarketplaceWebhook,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(MarketplaceWebhook.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}

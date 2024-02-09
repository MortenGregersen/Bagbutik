import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a marketplace webhook configuration
     Add a new endpoint URL and secret for alternative distribution package notifications.

     Each provider has a single marketplace webhooks `endpointUrl`, so if you operate mutliple marketplaces all notifications come to a single endpoint. The notification payload contains the `marketplaceAppId.`

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_a_marketplace_webhook_configuration>

     - Parameter requestBody: MarketplaceWebhook representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMarketplaceWebhookV1(requestBody: MarketplaceWebhookCreateRequest) -> Request<MarketplaceWebhookResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceWebhooks", method: .post, requestBody: requestBody)
    }
}

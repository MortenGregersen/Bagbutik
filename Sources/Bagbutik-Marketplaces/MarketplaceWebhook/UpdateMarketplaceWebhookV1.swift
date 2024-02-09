import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a marketplace webhook configuration
     Update the endpoint URL and secret for alternative distribution package notifications.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_marketplace_webhook_configuration>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MarketplaceWebhook representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateMarketplaceWebhookV1(id: String,
                                           requestBody: MarketplaceWebhookUpdateRequest) -> Request<MarketplaceWebhookResponse, ErrorResponse>
    {
        .init(path: "/v1/marketplaceWebhooks/\(id)", method: .patch, requestBody: requestBody)
    }
}

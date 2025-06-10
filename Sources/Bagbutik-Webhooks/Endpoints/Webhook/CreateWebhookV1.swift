import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a webhook configuration
     Add a new webhook configuration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-webhooks>

     - Parameter requestBody: Webhook representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createWebhookV1(requestBody: WebhookCreateRequest) -> Request<WebhookResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks",
            method: .post,
            requestBody: requestBody)
    }
}

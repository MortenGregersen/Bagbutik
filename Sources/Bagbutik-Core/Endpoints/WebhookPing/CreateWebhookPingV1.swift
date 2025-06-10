import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Test your webhook
     Send an event to your server to verify your server-side webhook configuration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-webhookPings>

     - Parameter requestBody: WebhookPing representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createWebhookPingV1(requestBody: WebhookPingCreateRequest) -> Request<WebhookPingResponse, ErrorResponse> {
        .init(
            path: "/v1/webhookPings",
            method: .post,
            requestBody: requestBody)
    }
}

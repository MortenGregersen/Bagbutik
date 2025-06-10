import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a webhook configuration
     Update details for a specific webhook.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-webhooks-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Webhook representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateWebhookV1(id: String,
                                requestBody: WebhookUpdateRequest) -> Request<WebhookResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

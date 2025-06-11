import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Redeliver a previous notification
     Resend a webhook notification from a specified template.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-webhookDeliveries>

     - Parameter requestBody: WebhookDelivery representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createWebhookDeliveryV1(requestBody: WebhookDeliveryCreateRequest) -> Request<WebhookDeliveryResponse, ErrorResponse> {
        .init(
            path: "/v1/webhookDeliveries",
            method: .post,
            requestBody: requestBody)
    }
}

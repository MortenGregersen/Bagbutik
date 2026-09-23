import BagbutikCore
import BagbutikWebhooksModels

public extension Request {
    /**
     # Redeliver a Previous Notification

     Resend a webhook notification from a specified template.

     ## Overview> Note: The `template` in this payload is the original delivery that you want to resend. Find the `id` using ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-webhooks-_id_-deliveries``.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

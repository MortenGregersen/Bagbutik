import BagbutikCore
import BagbutikWebhooksModels

public extension Request {
    /**
     # Test Your Webhook

     Send an event to your server to verify your server-side webhook configuration.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

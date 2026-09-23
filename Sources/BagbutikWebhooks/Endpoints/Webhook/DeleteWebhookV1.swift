import BagbutikCore
import BagbutikModelsShared
import BagbutikWebhooksModels

public extension Request {
    /**
     # Delete a Webhook

     Remove a specific webhook configuration.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-webhooks-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteWebhookV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks/\(id)",
            method: .delete)
    }
}

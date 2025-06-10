import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a webhook
     Remove a specific webhook configuration.

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

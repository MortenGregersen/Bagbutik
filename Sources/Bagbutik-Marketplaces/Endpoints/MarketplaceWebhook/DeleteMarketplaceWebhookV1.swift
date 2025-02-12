import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a marketplace webhook configuration
     Delete a specific marketplace notifcation endpoint URL.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-marketplaceWebhooks-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteMarketplaceWebhookV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceWebhooks/\(id)", method: .delete)
    }
}

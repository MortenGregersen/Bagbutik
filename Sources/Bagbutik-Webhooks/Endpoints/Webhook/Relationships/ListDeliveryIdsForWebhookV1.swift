import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/webhooks/{id}/relationships/deliveries

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-webhooks-_id_-relationships-deliveries>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDeliveryIdsForWebhookV1(id: String,
                                            limit: Int? = nil) -> Request<WebhookDeliveriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks/\(id)/relationships/deliveries",
            method: .get,
            parameters: .init(limit: limit))
    }
}

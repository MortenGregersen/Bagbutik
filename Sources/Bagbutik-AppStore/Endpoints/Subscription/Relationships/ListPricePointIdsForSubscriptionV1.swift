import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/pricePoints

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-pricePoints>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricePointIdsForSubscriptionV1(id: String,
                                                   limit: Int? = nil) -> Request<SubscriptionPricePointsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/pricePoints",
            method: .get,
            parameters: .init(limit: limit))
    }
}

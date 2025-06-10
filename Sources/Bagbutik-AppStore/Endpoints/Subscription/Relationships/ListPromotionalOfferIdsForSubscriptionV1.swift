import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/promotionalOffers

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-promotionalOffers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPromotionalOfferIdsForSubscriptionV1(id: String,
                                                         limit: Int? = nil) -> Request<SubscriptionPromotionalOffersLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/promotionalOffers",
            method: .get,
            parameters: .init(limit: limit))
    }
}

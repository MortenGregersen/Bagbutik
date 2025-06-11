import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionPromotionalOffers/{id}/relationships/prices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPromotionalOffers-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForSubscriptionPromotionalOfferV1(id: String,
                                                              limit: Int? = nil) -> Request<SubscriptionPromotionalOfferPricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPromotionalOffers/\(id)/relationships/prices",
            method: .get,
            parameters: .init(limit: limit))
    }
}

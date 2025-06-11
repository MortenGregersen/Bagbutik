import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/winBackOffers

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-winBackOffers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listWinBackOfferIdsForSubscriptionV1(id: String,
                                                     limit: Int? = nil) -> Request<SubscriptionWinBackOffersLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/winBackOffers",
            method: .get,
            parameters: .init(limit: limit))
    }
}

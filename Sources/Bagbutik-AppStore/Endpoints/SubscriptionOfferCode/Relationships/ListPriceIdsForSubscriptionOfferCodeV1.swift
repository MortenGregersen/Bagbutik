import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionOfferCodes/{id}/relationships/prices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForSubscriptionOfferCodeV1(id: String,
                                                       limit: Int? = nil) -> Request<SubscriptionOfferCodePricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)/relationships/prices",
            method: .get,
            parameters: .init(limit: limit))
    }
}

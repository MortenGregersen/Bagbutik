import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionOfferCodes/{id}/relationships/customCodes

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_-relationships-customCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomCodeIdsForSubscriptionOfferCodeV1(id: String,
                                                            limit: Int? = nil) -> Request<SubscriptionOfferCodeCustomCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)/relationships/customCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}

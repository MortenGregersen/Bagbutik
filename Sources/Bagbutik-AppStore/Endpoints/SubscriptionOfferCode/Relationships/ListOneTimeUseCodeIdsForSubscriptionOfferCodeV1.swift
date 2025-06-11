import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionOfferCodes/{id}/relationships/oneTimeUseCodes

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_-relationships-oneTimeUseCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listOneTimeUseCodeIdsForSubscriptionOfferCodeV1(id: String,
                                                                limit: Int? = nil) -> Request<SubscriptionOfferCodeOneTimeUseCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)/relationships/oneTimeUseCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}

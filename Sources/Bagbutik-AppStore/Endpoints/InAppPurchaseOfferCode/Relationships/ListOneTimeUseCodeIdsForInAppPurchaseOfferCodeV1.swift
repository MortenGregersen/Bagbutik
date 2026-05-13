import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All One-Time Use Code IDs for an In-App Purchase Offer Code
     Get a list of one-time use code resource IDs for a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-relationships-oneTimeUseCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listOneTimeUseCodeIdsForInAppPurchaseOfferCodeV1(id: String,
                                                                 limit: Int? = nil) -> Request<InAppPurchaseOfferCodeOneTimeUseCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/relationships/oneTimeUseCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all custom code IDs for an in-app purchase offer code
     Get a list of custom code resource IDs for a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-relationships-customCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomCodeIdsForInAppPurchaseOfferCodeV1(id: String,
                                                             limit: Int? = nil) -> Request<InAppPurchaseOfferCodeCustomCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/relationships/customCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}

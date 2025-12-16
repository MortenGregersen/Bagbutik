import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all price IDs for an in-app purchase offer code
     Get a list of price resource IDs for a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForInAppPurchaseOfferCodeV1(id: String,
                                                        limit: Int? = nil) -> Request<InAppPurchaseOfferCodePricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/relationships/prices",
            method: .get,
            parameters: .init(limit: limit))
    }
}

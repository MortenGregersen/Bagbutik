import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/pricePoints

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-pricePoints>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricePointIdsForInAppPurchasesV2(id: String,
                                                     limit: Int? = nil) -> Request<InAppPurchaseV2PricePointsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/pricePoints",
            method: .get,
            parameters: .init(limit: limit))
    }
}

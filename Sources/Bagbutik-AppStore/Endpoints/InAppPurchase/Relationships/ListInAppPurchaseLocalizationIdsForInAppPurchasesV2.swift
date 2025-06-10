import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/inAppPurchaseLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-inAppPurchaseLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchaseLocalizationIdsForInAppPurchasesV2(id: String,
                                                                    limit: Int? = nil) -> Request<InAppPurchaseV2InAppPurchaseLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/inAppPurchaseLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

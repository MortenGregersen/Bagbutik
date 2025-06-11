import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/promotedPurchase

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-promotedPurchase>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2PromotedPurchaseLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/promotedPurchase",
            method: .get)
    }
}

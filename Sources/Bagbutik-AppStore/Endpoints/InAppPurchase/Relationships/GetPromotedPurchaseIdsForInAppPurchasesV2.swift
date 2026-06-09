import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the promoted purchase ID for an in-app purchase
     Get the promoted purchase ID for a specific in-app purchase.

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

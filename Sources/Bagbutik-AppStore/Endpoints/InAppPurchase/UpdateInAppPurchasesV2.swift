import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an In-App Purchase
     Update the reference name of a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-inAppPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchasesV2(id: String,
                                       requestBody: InAppPurchaseV2UpdateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

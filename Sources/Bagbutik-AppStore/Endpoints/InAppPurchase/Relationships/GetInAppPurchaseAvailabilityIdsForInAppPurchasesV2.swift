import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/inAppPurchaseAvailability

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-inAppPurchaseAvailability>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseAvailabilityIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2InAppPurchaseAvailabilityLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/inAppPurchaseAvailability",
            method: .get)
    }
}

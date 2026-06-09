import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the price schedule ID for an in-app purchase
     Get the price schedule ID for a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-iapPriceSchedule>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getIapPriceScheduleIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2IapPriceScheduleLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/iapPriceSchedule",
            method: .get)
    }
}

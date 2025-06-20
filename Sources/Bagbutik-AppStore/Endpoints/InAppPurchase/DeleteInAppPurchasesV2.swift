import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an In-App Purchase
     Delete a specific in-app purchase from your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-inAppPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchasesV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)",
            method: .delete)
    }
}

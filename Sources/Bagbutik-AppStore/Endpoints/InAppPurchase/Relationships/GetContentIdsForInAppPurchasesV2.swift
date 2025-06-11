import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/content

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-content>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getContentIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2ContentLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/content",
            method: .get)
    }
}

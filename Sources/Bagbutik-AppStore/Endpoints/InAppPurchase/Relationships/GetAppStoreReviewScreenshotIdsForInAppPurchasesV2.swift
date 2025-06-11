import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/appStoreReviewScreenshot

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-appStoreReviewScreenshot>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewScreenshotIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2AppStoreReviewScreenshotLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/appStoreReviewScreenshot",
            method: .get)
    }
}

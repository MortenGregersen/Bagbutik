import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Store review screenshot ID for an in-app purchase
     Get the App Store review screenshot ID for a specific in-app purchase.

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

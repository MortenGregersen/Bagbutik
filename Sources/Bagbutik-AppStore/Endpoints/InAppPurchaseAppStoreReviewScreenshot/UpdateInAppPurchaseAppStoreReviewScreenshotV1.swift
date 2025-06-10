import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit a Review Screenshot for an In-App Purchase
     Commit an uploaded image asset as a review screenshot for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseAppStoreReviewScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseAppStoreReviewScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseAppStoreReviewScreenshotV1(id: String,
                                                              requestBody: InAppPurchaseAppStoreReviewScreenshotUpdateRequest) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

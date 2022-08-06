import Bagbutik_Models

public extension Request {
    /**
     # Create an In-App Purchase Review Screenshot
     Reserve a review screenshot for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_in-app_purchase_review_screenshot>

     - Parameter requestBody: InAppPurchaseAppStoreReviewScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseAppStoreReviewScreenshotV1(requestBody: InAppPurchaseAppStoreReviewScreenshotCreateRequest) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots", method: .post, requestBody: requestBody)
    }
}

import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app purchase review screenshot

     Reserve a review screenshot for an in-app purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseAppStoreReviewScreenshots>

     - Parameter requestBody: InAppPurchaseAppStoreReviewScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseAppStoreReviewScreenshotV1(requestBody: InAppPurchaseAppStoreReviewScreenshotCreateRequest) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAppStoreReviewScreenshots",
            method: .post,
            requestBody: requestBody)
    }
}

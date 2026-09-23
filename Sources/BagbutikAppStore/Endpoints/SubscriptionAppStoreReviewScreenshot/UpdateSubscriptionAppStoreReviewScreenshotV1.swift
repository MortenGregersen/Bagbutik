import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Commit a review screenshot for an auto-renewable subscription

     Commit an uploaded image asset as a review screenshot for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionAppStoreReviewScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionAppStoreReviewScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionAppStoreReviewScreenshotV1(id: String,
                                                             requestBody: SubscriptionAppStoreReviewScreenshotUpdateRequest) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

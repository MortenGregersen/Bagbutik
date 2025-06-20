import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit a Review Screenshot for an Auto-Renewable Subscription
     Commit an uploaded image asset as a review screenshot for an auto-renewable subscription.

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

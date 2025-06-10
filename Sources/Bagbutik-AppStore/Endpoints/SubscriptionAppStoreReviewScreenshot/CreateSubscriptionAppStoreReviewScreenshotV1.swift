import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Review Screenshot for an Auto-Renewable Subscription
     Reserve a review screenshot for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionAppStoreReviewScreenshots>

     - Parameter requestBody: SubscriptionAppStoreReviewScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionAppStoreReviewScreenshotV1(requestBody: SubscriptionAppStoreReviewScreenshotCreateRequest) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionAppStoreReviewScreenshots",
            method: .post,
            requestBody: requestBody)
    }
}

import Bagbutik_Core

public extension Request {
    /**
     # Delete a Review Screenshot for an Auto-Renewable Subscription
     Delete an image that you uploaded for review of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_review_screenshot_for_an_auto-renewable_subscription>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionAppStoreReviewScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)", method: .delete)
    }
}

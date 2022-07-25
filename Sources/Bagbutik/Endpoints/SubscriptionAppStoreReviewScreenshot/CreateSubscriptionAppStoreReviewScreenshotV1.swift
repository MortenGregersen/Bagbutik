public extension Request {
    /**
      # Create a Review Screenshot for an Auto-Renewable Subscription
      Reserve a review screenshot for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_review_screenshot_for_an_auto-renewable_subscription>

      - Parameter requestBody: SubscriptionAppStoreReviewScreenshot representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionAppStoreReviewScreenshotV1(requestBody: SubscriptionAppStoreReviewScreenshotCreateRequest) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionAppStoreReviewScreenshots", method: .post, requestBody: requestBody)
    }
}

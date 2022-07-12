public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionAppStoreReviewScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionAppStoreReviewScreenshotV1(requestBody: SubscriptionAppStoreReviewScreenshotCreateRequest) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionAppStoreReviewScreenshots", method: .post, requestBody: requestBody)
    }
}

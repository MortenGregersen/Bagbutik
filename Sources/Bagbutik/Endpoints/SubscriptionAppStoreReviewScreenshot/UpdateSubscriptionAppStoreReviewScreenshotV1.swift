public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionAppStoreReviewScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionAppStoreReviewScreenshotV1(id: String,
                                                             requestBody: SubscriptionAppStoreReviewScreenshotUpdateRequest) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}

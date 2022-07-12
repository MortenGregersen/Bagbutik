public extension Request {
    /**
      # No overview available

      - Parameter requestBody: InAppPurchaseAppStoreReviewScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createInAppPurchaseAppStoreReviewScreenshot(requestBody: InAppPurchaseAppStoreReviewScreenshotCreateRequest) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots", method: .post, requestBody: requestBody)
    }
}

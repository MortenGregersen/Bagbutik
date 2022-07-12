public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: InAppPurchaseAppStoreReviewScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateInAppPurchaseAppStoreReviewScreenshotV1(id: String,
                                                              requestBody: InAppPurchaseAppStoreReviewScreenshotUpdateRequest) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}

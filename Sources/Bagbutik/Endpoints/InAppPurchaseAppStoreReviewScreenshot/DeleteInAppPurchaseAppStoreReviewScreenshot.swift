public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteInAppPurchaseAppStoreReviewScreenshot(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .delete)
    }
}

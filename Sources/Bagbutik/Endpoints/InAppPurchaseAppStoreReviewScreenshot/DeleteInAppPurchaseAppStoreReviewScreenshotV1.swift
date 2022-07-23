public extension Request {
    /**
      # Delete a Review Screenshot for an In-App Purchase
      Delete an image that you uploaded for review of an in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_review_screenshot_for_an_in-app_purchase>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteInAppPurchaseAppStoreReviewScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .delete)
    }
}

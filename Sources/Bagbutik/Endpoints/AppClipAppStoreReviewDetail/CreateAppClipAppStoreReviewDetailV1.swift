public extension Request {
    /**
      # Create App Store Review Details for an App Clip
      Provide App Clip metadata required by App Store Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_app_store_review_details_for_an_app_clip>

      - Parameter requestBody: AppClipAppStoreReviewDetail representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipAppStoreReviewDetailV1(requestBody: AppClipAppStoreReviewDetailCreateRequest) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse> {
        return .init(path: "/v1/appClipAppStoreReviewDetails", method: .post, requestBody: requestBody)
    }
}

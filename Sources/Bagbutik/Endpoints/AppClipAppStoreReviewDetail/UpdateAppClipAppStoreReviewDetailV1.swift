public extension Request {
    /**
      # Modify App Store Review Details for an App Clip
      Update App Clip metadata you provide to App Store Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_app_store_review_details_for_an_app_clip>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppClipAppStoreReviewDetail representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAppStoreReviewDetailV1(id: String,
                                                    requestBody: AppClipAppStoreReviewDetailUpdateRequest) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipAppStoreReviewDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}

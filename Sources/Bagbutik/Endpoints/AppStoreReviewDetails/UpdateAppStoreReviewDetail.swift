public extension Request {
    /**
      # Modify an App Store Review Detail
      Update the app store review details, including the contact information, demo account, and notes.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_store_review_detail>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppStoreReviewDetail representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreReviewDetail(id: String,
                                           requestBody: AppStoreReviewDetailUpdateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreReviewDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # Create an App Store Review Detail
      Add App Store review details to an App Store version, including contact and demo account information.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_review_detail>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreReviewDetail(requestBody: AppStoreReviewDetailCreateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreReviewDetails", method: .post, requestBody: requestBody)
    }
}

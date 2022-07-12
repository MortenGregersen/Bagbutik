public extension Request {
    /**
      # Create an App Store Version Submission
      Submit an App Store version to App Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_version_submission>

      - Parameter requestBody: AppStoreVersionSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppStoreVersionSubmissionV1(requestBody: AppStoreVersionSubmissionCreateRequest) -> Request<AppStoreVersionSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionSubmissions", method: .post, requestBody: requestBody)
    }
}

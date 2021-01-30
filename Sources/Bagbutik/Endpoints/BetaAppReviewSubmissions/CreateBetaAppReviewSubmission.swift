public extension Request {
    /**
      # Submit an App for Beta Review
      Submit an app for beta app review to allow external testing.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/submit_an_app_for_beta_review>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaAppReviewSubmission(requestBody: BetaAppReviewSubmissionCreateRequest) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/betaAppReviewSubmissions", method: .post, requestBody: requestBody)
    }
}

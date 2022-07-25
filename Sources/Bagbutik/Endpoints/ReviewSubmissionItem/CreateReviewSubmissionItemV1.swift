public extension Request {
    /**
      # POST /v1/reviewSubmissions

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_reviewsubmissions>

      - Parameter requestBody: ReviewSubmissionItem representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createReviewSubmissionItemV1(requestBody: ReviewSubmissionItemCreateRequest) -> Request<ReviewSubmissionItemResponse, ErrorResponse> {
        return .init(path: "/v1/reviewSubmissionItems", method: .post, requestBody: requestBody)
    }
}

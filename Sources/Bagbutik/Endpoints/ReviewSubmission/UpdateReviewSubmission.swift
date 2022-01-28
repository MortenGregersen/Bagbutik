public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_reviewsubmissions_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: ReviewSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateReviewSubmission(id: String,
                                       requestBody: ReviewSubmissionUpdateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse>
    {
        return .init(path: "/v1/reviewSubmissions/\(id)", method: .patch, requestBody: requestBody)
    }
}

public extension Request {
    /**
     # POST /v1/reviewSubmissions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_reviewsubmissions>

     - Parameter requestBody: ReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createReviewSubmissionV1(requestBody: ReviewSubmissionCreateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse> {
        .init(path: "/v1/reviewSubmissions", method: .post, requestBody: requestBody)
    }
}

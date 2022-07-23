public extension Request {
    /**
      # Create a Review Submission for a Subscription
      Create a review submission for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_review_submission_for_a_subscription>

      - Parameter requestBody: SubscriptionSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionSubmissionV1(requestBody: SubscriptionSubmissionCreateRequest) -> Request<SubscriptionSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionSubmissions", method: .post, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionSubmissionV1(requestBody: SubscriptionSubmissionCreateRequest) -> Request<SubscriptionSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionSubmissions", method: .post, requestBody: requestBody)
    }
}

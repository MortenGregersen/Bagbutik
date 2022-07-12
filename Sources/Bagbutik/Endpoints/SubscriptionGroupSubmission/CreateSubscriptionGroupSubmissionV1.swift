public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionGroupSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionGroupSubmissionV1(requestBody: SubscriptionGroupSubmissionCreateRequest) -> Request<SubscriptionGroupSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionGroupSubmissions", method: .post, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # No overview available

      - Parameter requestBody: Subscription representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionV1(requestBody: SubscriptionCreateRequest) -> Request<SubscriptionResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptions", method: .post, requestBody: requestBody)
    }
}

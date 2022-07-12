public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionGroup representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionGroup(requestBody: SubscriptionGroupCreateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionGroups", method: .post, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionGroupLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionGroupLocalization(requestBody: SubscriptionGroupLocalizationCreateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionGroupLocalizations", method: .post, requestBody: requestBody)
    }
}

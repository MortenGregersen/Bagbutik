public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionLocalization(requestBody: SubscriptionLocalizationCreateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionLocalizations", method: .post, requestBody: requestBody)
    }
}

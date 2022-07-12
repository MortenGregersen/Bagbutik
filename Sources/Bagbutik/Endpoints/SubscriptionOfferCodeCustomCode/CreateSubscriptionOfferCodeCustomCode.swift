public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionOfferCodeCustomCode(requestBody: SubscriptionOfferCodeCustomCodeCreateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionOfferCodeCustomCodes", method: .post, requestBody: requestBody)
    }
}

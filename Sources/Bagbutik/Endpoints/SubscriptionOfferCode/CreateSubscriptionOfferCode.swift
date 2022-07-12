public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionOfferCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionOfferCode(requestBody: SubscriptionOfferCodeCreateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionOfferCodes", method: .post, requestBody: requestBody)
    }
}

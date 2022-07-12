public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionPrice representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionPriceV1(requestBody: SubscriptionPriceCreateRequest) -> Request<SubscriptionPriceResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionPrices", method: .post, requestBody: requestBody)
    }
}

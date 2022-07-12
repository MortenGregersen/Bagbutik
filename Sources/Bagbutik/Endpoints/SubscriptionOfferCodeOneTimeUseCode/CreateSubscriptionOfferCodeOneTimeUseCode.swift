public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionOfferCodeOneTimeUseCode(requestBody: SubscriptionOfferCodeOneTimeUseCodeCreateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes", method: .post, requestBody: requestBody)
    }
}

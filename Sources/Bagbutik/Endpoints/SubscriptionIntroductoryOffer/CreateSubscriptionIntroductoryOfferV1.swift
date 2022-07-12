public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionIntroductoryOffer representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionIntroductoryOfferV1(requestBody: SubscriptionIntroductoryOfferCreateRequest) -> Request<SubscriptionIntroductoryOfferResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionIntroductoryOffers", method: .post, requestBody: requestBody)
    }
}

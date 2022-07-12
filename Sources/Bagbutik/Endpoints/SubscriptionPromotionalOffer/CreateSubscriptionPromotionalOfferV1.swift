public extension Request {
    /**
      # No overview available

      - Parameter requestBody: SubscriptionPromotionalOffer representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionPromotionalOfferV1(requestBody: SubscriptionPromotionalOfferCreateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionPromotionalOffers", method: .post, requestBody: requestBody)
    }
}

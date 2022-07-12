public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionPromotionalOffer representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionPromotionalOffer(id: String,
                                                   requestBody: SubscriptionPromotionalOfferUpdateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionPromotionalOffers/\(id)", method: .patch, requestBody: requestBody)
    }
}

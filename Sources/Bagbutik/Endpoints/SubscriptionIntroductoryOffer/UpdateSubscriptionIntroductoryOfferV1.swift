public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionIntroductoryOffer representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionIntroductoryOfferV1(id: String,
                                                      requestBody: SubscriptionIntroductoryOfferUpdateRequest) -> Request<SubscriptionIntroductoryOfferResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionIntroductoryOffers/\(id)", method: .patch, requestBody: requestBody)
    }
}

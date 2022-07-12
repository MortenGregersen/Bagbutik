public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionOfferCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionOfferCode(id: String,
                                            requestBody: SubscriptionOfferCodeUpdateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodes/\(id)", method: .patch, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionOfferCodeCustomCode(id: String,
                                                      requestBody: SubscriptionOfferCodeCustomCodeUpdateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodeCustomCodes/\(id)", method: .patch, requestBody: requestBody)
    }
}

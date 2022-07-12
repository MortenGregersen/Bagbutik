public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionOfferCodeOneTimeUseCodeV1(id: String,
                                                            requestBody: SubscriptionOfferCodeOneTimeUseCodeUpdateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)", method: .patch, requestBody: requestBody)
    }
}

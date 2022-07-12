public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionGroupLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionGroupLocalizationV1(id: String,
                                                      requestBody: SubscriptionGroupLocalizationUpdateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionGroupLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionLocalization(id: String,
                                               requestBody: SubscriptionLocalizationUpdateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

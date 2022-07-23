public extension Request {
    /**
      # Modify a Subscription Localization
      Update a specific localized subscription display name and description for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_subscription_localization>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionLocalizationV1(id: String,
                                                 requestBody: SubscriptionLocalizationUpdateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

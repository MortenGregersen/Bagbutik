public extension Request {
    /**
     # Create a Subscription Localization
     Create a localized display name and description for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_subscription_localization>

     - Parameter requestBody: SubscriptionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionLocalizationV1(requestBody: SubscriptionLocalizationCreateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionLocalizations", method: .post, requestBody: requestBody)
    }
}

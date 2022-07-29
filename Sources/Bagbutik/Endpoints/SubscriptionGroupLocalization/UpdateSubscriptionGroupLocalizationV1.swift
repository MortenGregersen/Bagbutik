public extension Request {
    /**
     # Modify a Subscription Group Localization
     Update a specific localized display name and optional custom app name for a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_subscription_group_localization>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGroupLocalizationV1(id: String,
                                                      requestBody: SubscriptionGroupLocalizationUpdateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionGroupLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

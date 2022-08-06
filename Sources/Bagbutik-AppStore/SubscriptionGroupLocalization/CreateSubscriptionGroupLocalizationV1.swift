import Bagbutik_Models

public extension Request {
    /**
     # Create a Subscription Group Localization
     Create a localized display name and optional custom app name for a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_subscription_group_localization>

     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupLocalizationV1(requestBody: SubscriptionGroupLocalizationCreateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionGroupLocalizations", method: .post, requestBody: requestBody)
    }
}

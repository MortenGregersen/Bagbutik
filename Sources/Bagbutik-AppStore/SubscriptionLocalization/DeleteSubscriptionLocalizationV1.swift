import Bagbutik_Models

public extension Request {
    /**
     # Delete a Subscription Localization
     Delete localized metadata that you configured for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_subscription_localization>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionLocalizations/\(id)", method: .delete)
    }
}

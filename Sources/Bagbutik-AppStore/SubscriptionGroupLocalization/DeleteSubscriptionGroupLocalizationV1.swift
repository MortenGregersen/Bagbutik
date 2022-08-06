import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Subscription Group Localization
     Delete localized metadata that you configured for a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_subscription_group_localization>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionGroupLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionGroupLocalizations/\(id)", method: .delete)
    }
}

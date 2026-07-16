import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a subscription group localization
     Delete a localized custom name for a subscription group configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-subscriptionGroupLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionGroupLocalizationsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/subscriptionGroupLocalizations/\(id)",
            method: .delete)
    }
}

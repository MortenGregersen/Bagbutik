import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a subscription localization
     Delete a localized display name and description for a subscription configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-subscriptionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionLocalizationsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/subscriptionLocalizations/\(id)",
            method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an in-app purchase localization
     Delete a localized display name and description for an in-app purchase configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-inAppPurchaseLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchaseLocalizationsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseLocalizations/\(id)",
            method: .delete)
    }
}

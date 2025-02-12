import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an In-App Purchase Localization
     Delete the metadata for a single in-app purchase localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-inAppPurchaseLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchaseLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an in-app purchase localization
     Update the display name and description for a specific locale of an in-app purchase configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-inAppPurchaseLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseLocalizationsV2(id: String,
                                                   requestBody: InAppPurchaseLocalizationV2UpdateRequest) -> Request<InAppPurchaseLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an In-App Purchase Localization
     Update the display name and description for a specific locale of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseLocalizationV1(id: String,
                                                  requestBody: InAppPurchaseLocalizationUpdateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

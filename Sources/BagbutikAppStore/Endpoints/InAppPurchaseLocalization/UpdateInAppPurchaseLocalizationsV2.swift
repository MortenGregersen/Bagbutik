import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an in-app purchase localization

     Update the display name and description for a specific locale of an in-app purchase configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

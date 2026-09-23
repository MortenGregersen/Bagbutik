import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an In-App Purchase localization

     Delete a localized display name and description for an In-App Purchase configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

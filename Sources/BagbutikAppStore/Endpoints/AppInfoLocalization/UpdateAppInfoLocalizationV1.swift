import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app info localization

     Modify localized app-level information for a particular language.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appInfoLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppInfoLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppInfoLocalizationV1(id: String,
                                            requestBody: AppInfoLocalizationUpdateRequest) -> Request<AppInfoLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfoLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

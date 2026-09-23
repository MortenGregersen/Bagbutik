import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app store version localization

     Modify localized version-level information for a particular language.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionLocalizationV1(id: String,
                                                    requestBody: AppStoreVersionLocalizationUpdateRequest) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store Version Localization
     Modify localized version-level information for a particular language.

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

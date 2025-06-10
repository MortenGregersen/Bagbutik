import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Info Localization
     Modify localized app-level information for a particular language.

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

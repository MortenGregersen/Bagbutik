import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Localization for a Default App Clip Experience
     Update localized metadata for a specific default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipDefaultExperienceLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipDefaultExperienceLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipDefaultExperienceLocalizationV1(id: String,
                                                             requestBody: AppClipDefaultExperienceLocalizationUpdateRequest) -> Request<AppClipDefaultExperienceLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperienceLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

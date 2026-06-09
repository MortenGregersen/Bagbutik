import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create the localized metadata for a default app clip experience
     Provide localized metadata that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appClipDefaultExperienceLocalizations>

     - Parameter requestBody: AppClipDefaultExperienceLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipDefaultExperienceLocalizationV1(requestBody: AppClipDefaultExperienceLocalizationCreateRequest) -> Request<AppClipDefaultExperienceLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperienceLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

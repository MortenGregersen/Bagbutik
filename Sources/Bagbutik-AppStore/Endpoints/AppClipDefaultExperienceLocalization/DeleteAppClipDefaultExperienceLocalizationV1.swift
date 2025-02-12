import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Default App Clip Experience Localization
     Delete localized metadata that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appClipDefaultExperienceLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppClipDefaultExperienceLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appClipDefaultExperienceLocalizations/\(id)", method: .delete)
    }
}

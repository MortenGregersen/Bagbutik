import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Beta App Localization
     Delete a beta app localization associated with an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaAppLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaAppLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/betaAppLocalizations/\(id)", method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Info Localization
     Delete an app information localization that is associated with an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appInfoLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppInfoLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appInfoLocalizations/\(id)", method: .delete)
    }
}

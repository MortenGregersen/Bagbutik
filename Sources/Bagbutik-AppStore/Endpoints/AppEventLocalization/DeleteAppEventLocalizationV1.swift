import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Event Localization
     Delete localized metadata that you configured for an in-app event.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appEventLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)",
            method: .delete)
    }
}

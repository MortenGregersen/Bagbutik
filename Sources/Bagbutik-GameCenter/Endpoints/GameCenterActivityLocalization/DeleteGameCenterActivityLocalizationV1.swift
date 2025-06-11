import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an activity localization
     Remove a specific localization from a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivityLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterActivityLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)",
            method: .delete)
    }
}

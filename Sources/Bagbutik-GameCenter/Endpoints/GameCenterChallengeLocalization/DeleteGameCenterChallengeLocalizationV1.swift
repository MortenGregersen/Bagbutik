import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a challenge localization
     Remove a specific localization from a Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterChallengeLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterChallengeLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations/\(id)",
            method: .delete)
    }
}

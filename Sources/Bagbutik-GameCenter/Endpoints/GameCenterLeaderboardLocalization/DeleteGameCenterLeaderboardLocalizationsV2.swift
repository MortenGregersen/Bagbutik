import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Game Center leaderboard localization
     Delete a specific Game Center leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-gameCenterLeaderboardLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardLocalizationsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)",
            method: .delete)
    }
}

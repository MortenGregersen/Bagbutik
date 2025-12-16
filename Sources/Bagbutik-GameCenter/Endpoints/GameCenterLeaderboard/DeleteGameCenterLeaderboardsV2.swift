import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Game Center leaderboard
     Delete a specific Game Center leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-gameCenterLeaderboards-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)",
            method: .delete)
    }
}

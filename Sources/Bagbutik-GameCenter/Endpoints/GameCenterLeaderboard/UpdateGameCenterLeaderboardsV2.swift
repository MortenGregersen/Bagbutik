import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard
     Update a specific Game Center leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboards-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboard representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardsV2(id: String,
                                               requestBody: GameCenterLeaderboardV2UpdateRequest) -> Request<GameCenterLeaderboardV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

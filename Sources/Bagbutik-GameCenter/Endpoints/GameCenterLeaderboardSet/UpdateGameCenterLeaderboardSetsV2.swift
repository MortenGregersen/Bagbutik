import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard set
     Update a specific Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardSets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetsV2(id: String,
                                                  requestBody: GameCenterLeaderboardSetV2UpdateRequest) -> Request<GameCenterLeaderboardSetV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit a leaderboard set
     Modify the metadata for a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetV1(id: String,
                                                 requestBody: GameCenterLeaderboardSetUpdateRequest) -> Request<GameCenterLeaderboardSetResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)", method: .patch, requestBody: requestBody)
    }
}

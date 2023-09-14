import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit a leaderboard
     Modify the details of a leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_a_leaderboard>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboard representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardV1(id: String,
                                              requestBody: GameCenterLeaderboardUpdateRequest) -> Request<GameCenterLeaderboardResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboards/\(id)", method: .patch, requestBody: requestBody)
    }
}

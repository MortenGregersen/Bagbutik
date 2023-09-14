import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard set
     Add a new leaderboard set to your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_leaderboard_set>

     - Parameter requestBody: GameCenterLeaderboardSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetV1(requestBody: GameCenterLeaderboardSetCreateRequest) -> Request<GameCenterLeaderboardSetResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSets", method: .post, requestBody: requestBody)
    }
}

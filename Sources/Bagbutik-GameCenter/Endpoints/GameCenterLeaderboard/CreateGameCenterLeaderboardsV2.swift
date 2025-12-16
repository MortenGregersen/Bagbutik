import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard
     Create a Game Center leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboards>

     - Parameter requestBody: GameCenterLeaderboard representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardsV2(requestBody: GameCenterLeaderboardV2CreateRequest) -> Request<GameCenterLeaderboardV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards",
            method: .post,
            requestBody: requestBody)
    }
}

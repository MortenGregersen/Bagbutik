import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard
     Add a new leaderboard to your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboards>

     - Parameter requestBody: GameCenterLeaderboard representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardV1(requestBody: GameCenterLeaderboardCreateRequest) -> Request<GameCenterLeaderboardResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards",
            method: .post,
            requestBody: requestBody)
    }
}

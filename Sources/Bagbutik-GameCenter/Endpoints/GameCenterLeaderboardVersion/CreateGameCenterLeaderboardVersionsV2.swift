import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard version
     Create a Game Center leaderboard version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardVersions>

     - Parameter requestBody: GameCenterLeaderboardVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardVersionsV2(requestBody: GameCenterLeaderboardVersionV2CreateRequest) -> Request<GameCenterLeaderboardVersionV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardVersions",
            method: .post,
            requestBody: requestBody)
    }
}

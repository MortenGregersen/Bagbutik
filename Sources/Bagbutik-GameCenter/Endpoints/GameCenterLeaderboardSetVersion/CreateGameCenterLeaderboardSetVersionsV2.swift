import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard set version
     Create a Game Center leaderboard set version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSetVersions>

     - Parameter requestBody: GameCenterLeaderboardSetVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetVersionsV2(requestBody: GameCenterLeaderboardSetVersionV2CreateRequest) -> Request<GameCenterLeaderboardSetVersionV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetVersions",
            method: .post,
            requestBody: requestBody)
    }
}

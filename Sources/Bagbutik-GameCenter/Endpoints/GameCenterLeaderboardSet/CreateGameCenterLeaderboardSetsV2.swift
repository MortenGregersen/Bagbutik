import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard set
     Create a Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSets>

     - Parameter requestBody: GameCenterLeaderboardSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetsV2(requestBody: GameCenterLeaderboardSetV2CreateRequest) -> Request<GameCenterLeaderboardSetV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets",
            method: .post,
            requestBody: requestBody)
    }
}

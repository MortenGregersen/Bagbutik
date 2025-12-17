import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard image
     Create a Game Center leaderboard image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardImages>

     - Parameter requestBody: GameCenterLeaderboardImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardImagesV2(requestBody: GameCenterLeaderboardImageV2CreateRequest) -> Request<GameCenterLeaderboardImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardImages",
            method: .post,
            requestBody: requestBody)
    }
}

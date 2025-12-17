import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard set image
     Create a Game Center leaderboard set image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSetImages>

     - Parameter requestBody: GameCenterLeaderboardSetImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetImagesV2(requestBody: GameCenterLeaderboardSetImageV2CreateRequest) -> Request<GameCenterLeaderboardSetImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetImages",
            method: .post,
            requestBody: requestBody)
    }
}

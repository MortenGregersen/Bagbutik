import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard set image
     Add a new leaderboard set image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetImages>

     - Parameter requestBody: GameCenterLeaderboardSetImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetImageV1(requestBody: GameCenterLeaderboardSetImageCreateRequest) -> Request<GameCenterLeaderboardSetImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetImages",
            method: .post,
            requestBody: requestBody)
    }
}

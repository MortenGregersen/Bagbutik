import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard image
     Add a new leaderboard image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardImages>

     - Parameter requestBody: GameCenterLeaderboardImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardImageV1(requestBody: GameCenterLeaderboardImageCreateRequest) -> Request<GameCenterLeaderboardImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardImages",
            method: .post,
            requestBody: requestBody)
    }
}

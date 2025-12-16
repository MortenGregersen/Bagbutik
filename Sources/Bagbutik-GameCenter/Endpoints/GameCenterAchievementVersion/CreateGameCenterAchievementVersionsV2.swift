import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center achievement version
     Create a Game Center achievement version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterAchievementVersions>

     - Parameter requestBody: GameCenterAchievementVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementVersionsV2(requestBody: GameCenterAchievementVersionV2CreateRequest) -> Request<GameCenterAchievementVersionV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementVersions",
            method: .post,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center achievement
     Create a Game Center achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterAchievements>

     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementsV2(requestBody: GameCenterAchievementV2CreateRequest) -> Request<GameCenterAchievementV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements",
            method: .post,
            requestBody: requestBody)
    }
}

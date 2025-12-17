import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center achievement
     Update a specific Game Center achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementsV2(id: String,
                                               requestBody: GameCenterAchievementV2UpdateRequest) -> Request<GameCenterAchievementV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

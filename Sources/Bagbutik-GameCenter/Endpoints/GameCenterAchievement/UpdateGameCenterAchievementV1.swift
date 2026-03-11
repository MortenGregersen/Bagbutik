import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an achievement
     Modify properties for a specific achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGameCenterAchievementV1(id: String,
                                              requestBody: GameCenterAchievementUpdateRequest) -> Request<GameCenterAchievementResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

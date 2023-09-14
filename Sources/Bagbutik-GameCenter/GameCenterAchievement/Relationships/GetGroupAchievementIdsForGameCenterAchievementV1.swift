import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List group achievements for an achievement
     List associated group achievements for a specific achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_group_achievements_for_an_achievement>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGroupAchievementIdsForGameCenterAchievementV1(id: String) -> Request<GameCenterAchievementGroupAchievementLinkageResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievements/\(id)/relationships/groupAchievement", method: .get)
    }
}

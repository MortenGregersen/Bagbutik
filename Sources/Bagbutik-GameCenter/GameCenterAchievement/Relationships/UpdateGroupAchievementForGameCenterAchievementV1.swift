import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the group for an achievement
     Modify the achievement group for a specific achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_group_for_an_achievement>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGroupAchievementForGameCenterAchievementV1(id: String,
                                                                 requestBody: GameCenterAchievementGroupAchievementLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievements/\(id)/relationships/groupAchievement", method: .patch, requestBody: requestBody)
    }
}

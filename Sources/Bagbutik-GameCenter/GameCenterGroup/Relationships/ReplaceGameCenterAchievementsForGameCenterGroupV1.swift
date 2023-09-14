import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the achievements associated with a group
     Modify the achievements in a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_the_achievements_associated_with_a_group>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterAchievementsForGameCenterGroupV1(id: String,
                                                                  requestBody: GameCenterGroupGameCenterAchievementsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterAchievements", method: .patch, requestBody: requestBody)
    }
}

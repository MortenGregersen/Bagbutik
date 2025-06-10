import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the achievements in a group
     List all the achievements associated with a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterAchievements>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementIdsForGameCenterGroupV1(id: String,
                                                                 limit: Int? = nil) -> Request<GameCenterGroupGameCenterAchievementsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterAchievements",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all achievement IDs for a Game Center group
     Get a list of achievement resource IDs for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterAchievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementsV2IdsForGameCenterGroupV1(id: String,
                                                                    limit: Int? = nil) -> Request<GameCenterGroupGameCenterAchievementsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterAchievementsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

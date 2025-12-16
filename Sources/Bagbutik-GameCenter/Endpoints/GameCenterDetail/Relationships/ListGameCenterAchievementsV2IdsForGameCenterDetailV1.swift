import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all achievement IDs for a Game Center detail
     Get a list of achievement resource IDs for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterAchievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementsV2IdsForGameCenterDetailV1(id: String,
                                                                     limit: Int? = nil) -> Request<GameCenterDetailGameCenterAchievementsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterAchievementsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

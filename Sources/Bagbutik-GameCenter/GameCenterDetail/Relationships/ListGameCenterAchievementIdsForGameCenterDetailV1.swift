import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List achievements
     List the achievements for a Game center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterAchievements>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementIdsForGameCenterDetailV1(id: String,
                                                                  limit: Int? = nil) -> Request<GameCenterDetailGameCenterAchievementsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterAchievements", method: .get, parameters: .init(limit: limit))
    }
}

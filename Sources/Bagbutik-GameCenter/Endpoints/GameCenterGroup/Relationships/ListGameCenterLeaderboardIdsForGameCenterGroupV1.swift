import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the leaderboards in a group
     List all the leaderboard associated with a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardIdsForGameCenterGroupV1(id: String,
                                                                 limit: Int? = nil) -> Request<GameCenterGroupGameCenterLeaderboardsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboards", method: .get, parameters: .init(limit: limit))
    }
}

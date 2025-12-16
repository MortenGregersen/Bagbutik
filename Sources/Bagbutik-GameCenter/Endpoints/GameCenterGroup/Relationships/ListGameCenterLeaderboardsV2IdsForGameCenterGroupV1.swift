import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all leaderboard IDs for a Game Center group
     Get a list of leaderboard resource IDs for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardsV2IdsForGameCenterGroupV1(id: String,
                                                                    limit: Int? = nil) -> Request<GameCenterGroupGameCenterLeaderboardsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboardsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

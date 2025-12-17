import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all leaderboard set IDs for a Game Center group
     Get a list of leaderboard set resource IDs for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboardSetsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardSetsV2IdsForGameCenterGroupV1(id: String,
                                                                       limit: Int? = nil) -> Request<GameCenterGroupGameCenterLeaderboardSetsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboardSetsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

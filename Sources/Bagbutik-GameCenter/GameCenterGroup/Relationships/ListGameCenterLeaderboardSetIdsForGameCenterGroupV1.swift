import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the leaderboard sets in a group
     List all the leaderboard sets associated with a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_leaderboard_sets_in_a_group>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardSetIdsForGameCenterGroupV1(id: String,
                                                                    limit: Int? = nil) -> Request<GameCenterGroupGameCenterLeaderboardSetsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboardSets", method: .get, parameters: .init(limit: limit))
    }
}

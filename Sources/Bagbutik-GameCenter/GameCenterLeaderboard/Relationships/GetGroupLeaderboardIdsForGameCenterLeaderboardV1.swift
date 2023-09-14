import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all groups to which a leaderboard belongs
     List associated group leaderboards for a specific leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_groups_to_which_a_leaderboard_belongs>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGroupLeaderboardIdsForGameCenterLeaderboardV1(id: String) -> Request<GameCenterLeaderboardGroupLeaderboardLinkageResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboards/\(id)/relationships/groupLeaderboard", method: .get)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a leaderboard set
     Delete a specifc leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_leaderboard_set>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardSetV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)", method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete the relationship between a leaderboard and a leaderboard set
     Remove a leaderboard from a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardsForGameCenterLeaderboardSetV1(id: String,
                                                                          requestBody: GameCenterLeaderboardSetGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .delete,
            requestBody: requestBody)
    }
}

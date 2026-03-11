import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the leaderboards in a leaderboard set
     List all leaderboards in a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listGameCenterLeaderboardIdsForGameCenterLeaderboardSetV1(id: String,
                                                                          limit: Int? = nil) -> Request<GameCenterLeaderboardSetGameCenterLeaderboardsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboards in leaderboard set
     Edit the positions of leaderboards in an existing leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsForGameCenterLeaderboardSetV1(id: String,
                                                                           requestBody: GameCenterLeaderboardSetGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards", method: .patch, requestBody: requestBody)
    }
}

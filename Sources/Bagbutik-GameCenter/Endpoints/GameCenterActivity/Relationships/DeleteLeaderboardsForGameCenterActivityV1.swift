import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a leaderboard from an activity
     Remove the relationship between a leaderboard and a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_-relationships-leaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteLeaderboardsForGameCenterActivityV1(id: String,
                                                          requestBody: GameCenterActivityLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/leaderboards",
            method: .delete,
            requestBody: requestBody)
    }
}

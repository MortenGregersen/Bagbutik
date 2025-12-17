import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a leaderboard
     Remove a leaderboard from a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_-relationships-leaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteLeaderboardsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityLeaderboardsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/leaderboardsV2",
            method: .delete,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a leaderboard to a Game Center activity
     Add a leaderboard to a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities-_id_-relationships-leaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createLeaderboardsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityLeaderboardsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/leaderboardsV2",
            method: .post,
            requestBody: requestBody)
    }
}

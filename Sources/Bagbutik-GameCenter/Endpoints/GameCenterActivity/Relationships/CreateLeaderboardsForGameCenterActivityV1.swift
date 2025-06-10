import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboards for a Game Center activity
     Update the relationship between a leaderboard and a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities-_id_-relationships-leaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createLeaderboardsForGameCenterActivityV1(id: String,
                                                          requestBody: GameCenterActivityLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/leaderboards",
            method: .post,
            requestBody: requestBody)
    }
}

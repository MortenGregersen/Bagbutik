import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the activity for a Game Center leaderboard
     Update the activity relationship for a specific Game Center leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboards-_id_-relationships-activity>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateActivityForGameCenterLeaderboardsV2(id: String,
                                                          requestBody: GameCenterLeaderboardV2ActivityLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/relationships/activity",
            method: .patch,
            requestBody: requestBody)
    }
}

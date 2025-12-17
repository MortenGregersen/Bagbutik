import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboards for a Game Center leaderboard set
     Update the leaderboards relationship for a specific Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsForGameCenterLeaderboardSetsV2(id: String,
                                                                            requestBody: GameCenterLeaderboardSetV2GameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .patch,
            requestBody: requestBody)
    }
}

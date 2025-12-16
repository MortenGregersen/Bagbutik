import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Game Center leaderboard set
     Delete a specific Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardsForGameCenterLeaderboardSetsV2(id: String,
                                                                           requestBody: GameCenterLeaderboardSetV2GameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .delete,
            requestBody: requestBody)
    }
}

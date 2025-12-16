import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a leaderboard to a Game Center leaderboard set
     Add a leaderboard to a Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardsForGameCenterLeaderboardSetsV2(id: String,
                                                                           requestBody: GameCenterLeaderboardSetV2GameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .post,
            requestBody: requestBody)
    }
}

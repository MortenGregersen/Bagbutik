import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all version IDs for a Game Center leaderboard set
     Get a list of version resource IDs for a specific Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSets-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForGameCenterLeaderboardSetsV2(id: String,
                                                             limit: Int? = nil) -> Request<GameCenterLeaderboardSetV2VersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

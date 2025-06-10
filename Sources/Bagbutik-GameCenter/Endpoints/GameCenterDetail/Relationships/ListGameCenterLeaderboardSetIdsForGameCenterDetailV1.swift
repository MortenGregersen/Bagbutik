import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List leaderboard sets
     List all leaderboards for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboardSets>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardSetIdsForGameCenterDetailV1(id: String,
                                                                     limit: Int? = nil) -> Request<GameCenterDetailGameCenterLeaderboardSetsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardSets",
            method: .get,
            parameters: .init(limit: limit))
    }
}

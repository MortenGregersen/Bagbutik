import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all leaderboard IDs for a Game Center detail
     Get a list of leaderboard resource IDs for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardsV2IdsForGameCenterDetailV1(id: String,
                                                                     limit: Int? = nil) -> Request<GameCenterDetailGameCenterLeaderboardsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

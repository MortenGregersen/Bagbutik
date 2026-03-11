import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List leaderboards
     ​List all leaderboards for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listGameCenterLeaderboardIdsForGameCenterDetailV1(id: String,
                                                                  limit: Int? = nil) -> Request<GameCenterDetailGameCenterLeaderboardsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboards",
            method: .get,
            parameters: .init(limit: limit))
    }
}

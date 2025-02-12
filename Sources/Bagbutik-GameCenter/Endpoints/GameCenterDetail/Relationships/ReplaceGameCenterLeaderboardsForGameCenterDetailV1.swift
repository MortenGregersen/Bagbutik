import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the associated leaderboards for a Game Center detail
     Edit the associated leaderboards for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsForGameCenterDetailV1(id: String,
                                                                   requestBody: GameCenterDetailGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboards", method: .patch, requestBody: requestBody)
    }
}

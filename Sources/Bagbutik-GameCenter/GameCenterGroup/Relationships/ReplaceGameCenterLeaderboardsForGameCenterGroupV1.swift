import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the leaderboard associated with a group
     Modify the Game Center leaderboards in a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsForGameCenterGroupV1(id: String,
                                                                  requestBody: GameCenterGroupGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboards", method: .patch, requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the leaderboard sets associated with a group
     Modify the leaderboard sets in a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboardSets>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardSetsForGameCenterGroupV1(id: String,
                                                                     requestBody: GameCenterGroupGameCenterLeaderboardSetsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboardSets", method: .patch, requestBody: requestBody)
    }
}

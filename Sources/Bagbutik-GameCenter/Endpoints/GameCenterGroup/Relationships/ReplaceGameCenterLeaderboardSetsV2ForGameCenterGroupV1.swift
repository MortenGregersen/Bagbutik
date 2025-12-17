import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboard sets for a Game Center group
     Update the leaderboard sets relationship for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_-relationships-gameCenterLeaderboardSetsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardSetsV2ForGameCenterGroupV1(id: String,
                                                                       requestBody: GameCenterGroupGameCenterLeaderboardSetsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterLeaderboardSetsV2",
            method: .patch,
            requestBody: requestBody)
    }
}

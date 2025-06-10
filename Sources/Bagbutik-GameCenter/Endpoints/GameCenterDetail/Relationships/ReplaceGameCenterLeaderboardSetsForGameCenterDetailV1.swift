import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the associated leaderboard sets for a Game Center detail
     Edit the associated leaderboard sets for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboardSets>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardSetsForGameCenterDetailV1(id: String,
                                                                      requestBody: GameCenterDetailGameCenterLeaderboardSetsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardSets",
            method: .patch,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboard sets for a Game Center detail
     Update the leaderboard sets relationship for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboardSetsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardSetsV2ForGameCenterDetailV1(id: String,
                                                                        requestBody: GameCenterDetailGameCenterLeaderboardSetsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardSetsV2",
            method: .patch,
            requestBody: requestBody)
    }
}

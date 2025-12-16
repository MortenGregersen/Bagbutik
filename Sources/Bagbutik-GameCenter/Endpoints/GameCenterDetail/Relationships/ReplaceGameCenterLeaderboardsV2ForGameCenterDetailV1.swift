import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboards for a Game Center detail
     Update the leaderboards relationship for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-gameCenterLeaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsV2ForGameCenterDetailV1(id: String,
                                                                     requestBody: GameCenterDetailGameCenterLeaderboardsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardsV2",
            method: .patch,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the challenge for a Game Center leaderboard
     Update the challenge relationship for a specific Game Center leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboards-_id_-relationships-challenge>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateChallengeForGameCenterLeaderboardsV2(id: String,
                                                           requestBody: GameCenterLeaderboardV2ChallengeLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/relationships/challenge",
            method: .patch,
            requestBody: requestBody)
    }
}

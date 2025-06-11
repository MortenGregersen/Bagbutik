import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboard for a challenge
     Update the relationship between a leaderbaord and a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallenges-_id_-relationships-leaderboard>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateLeaderboardForGameCenterChallengeV1(id: String,
                                                          requestBody: GameCenterChallengeLeaderboardLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)/relationships/leaderboard",
            method: .patch,
            requestBody: requestBody)
    }
}

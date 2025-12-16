import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the leaderboard for a Game Center challenge
     Update the leaderboard relationship for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallenges-_id_-relationships-leaderboardV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateLeaderboardV2ForGameCenterChallengeV1(id: String,
                                                            requestBody: GameCenterChallengeLeaderboardV2LinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)/relationships/leaderboardV2",
            method: .patch,
            requestBody: requestBody)
    }
}

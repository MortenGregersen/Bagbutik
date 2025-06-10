import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a challenge
     Add a challenge to a Game Center detail or group by referencing an existing leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallenges>

     - Parameter requestBody: GameCenterChallenge representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeV1(requestBody: GameCenterChallengeCreateRequest) -> Request<GameCenterChallengeResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges",
            method: .post,
            requestBody: requestBody)
    }
}

import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Challenge

     Add a challenge to a Game Center detail or group by referencing an existing leaderboard.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a challenge version
     Add a version for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeVersions>

     - Parameter requestBody: GameCenterChallengeVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeVersionV1(requestBody: GameCenterChallengeVersionCreateRequest) -> Request<GameCenterChallengeVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersions",
            method: .post,
            requestBody: requestBody)
    }
}

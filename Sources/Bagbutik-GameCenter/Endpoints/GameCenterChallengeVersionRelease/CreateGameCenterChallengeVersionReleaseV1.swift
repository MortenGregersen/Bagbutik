import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a challenge version release
     Add a version release for a specific Game Center challenge version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeVersionReleases>

     - Parameter requestBody: GameCenterChallengeVersionRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeVersionReleaseV1(requestBody: GameCenterChallengeVersionReleaseCreateRequest) -> Request<GameCenterChallengeVersionReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersionReleases",
            method: .post,
            requestBody: requestBody)
    }
}

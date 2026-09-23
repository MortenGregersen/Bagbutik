import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Add a Challenge Version Release

     Add a version release for a specific Game Center challenge version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeVersionReleases>

     - Parameter requestBody: GameCenterChallengeVersionRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterChallengeVersionReleaseV1(requestBody: GameCenterChallengeVersionReleaseCreateRequest) -> Request<GameCenterChallengeVersionReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersionReleases",
            method: .post,
            requestBody: requestBody)
    }
}

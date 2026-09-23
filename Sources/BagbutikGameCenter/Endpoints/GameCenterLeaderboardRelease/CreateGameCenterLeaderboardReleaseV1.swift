import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Leaderboard Release

     Add a new leaderboard release.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardReleases>

     - Parameter requestBody: GameCenterLeaderboardRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardReleaseV1(requestBody: GameCenterLeaderboardReleaseCreateRequest) -> Request<GameCenterLeaderboardReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardReleases",
            method: .post,
            requestBody: requestBody)
    }
}

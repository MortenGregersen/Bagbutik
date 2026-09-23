import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Leaderboard Set Image

     Add a new leaderboard set image.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetImages>

     - Parameter requestBody: GameCenterLeaderboardSetImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardSetImageV1(requestBody: GameCenterLeaderboardSetImageCreateRequest) -> Request<GameCenterLeaderboardSetImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetImages",
            method: .post,
            requestBody: requestBody)
    }
}

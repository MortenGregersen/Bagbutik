import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Leaderboard Set Localization

     Add a new leaderboard set localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardSetLocalizationV1(requestBody: GameCenterLeaderboardSetLocalizationCreateRequest) -> Request<GameCenterLeaderboardSetLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

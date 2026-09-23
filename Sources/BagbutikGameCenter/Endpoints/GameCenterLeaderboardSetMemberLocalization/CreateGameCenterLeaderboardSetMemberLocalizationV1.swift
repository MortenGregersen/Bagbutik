import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Leaderboard Set Member Localization

     Add a new leaderboard set localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetMemberLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetMemberLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetMemberLocalizationV1(requestBody: GameCenterLeaderboardSetMemberLocalizationCreateRequest) -> Request<GameCenterLeaderboardSetMemberLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetMemberLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

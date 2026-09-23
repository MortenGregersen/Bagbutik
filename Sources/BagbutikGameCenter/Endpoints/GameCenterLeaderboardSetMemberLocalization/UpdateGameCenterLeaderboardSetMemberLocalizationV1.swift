import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Leaderboard Set Member Localization

     Edit a leaderboard set member localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSetMemberLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetMemberLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetMemberLocalizationV1(id: String,
                                                                   requestBody: GameCenterLeaderboardSetMemberLocalizationUpdateRequest) -> Request<GameCenterLeaderboardSetMemberLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetMemberLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

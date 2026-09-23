import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Leaderboard Set Localization

     Edit a leaderboard set localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSetLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGameCenterLeaderboardSetLocalizationV1(id: String,
                                                             requestBody: GameCenterLeaderboardSetLocalizationUpdateRequest) -> Request<GameCenterLeaderboardSetLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

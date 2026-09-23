import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Leaderboard Set Localization

     Update a specific Game Center leaderboard set localization.

     ## Overview

     - id:
     - 200:
     - 400:
     - 401:
     - 403:
     - 404:
     - 409:
     - 422:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardSetLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetLocalizationsV2(id: String,
                                                              requestBody: GameCenterLeaderboardSetLocalizationV2UpdateRequest) -> Request<GameCenterLeaderboardSetLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

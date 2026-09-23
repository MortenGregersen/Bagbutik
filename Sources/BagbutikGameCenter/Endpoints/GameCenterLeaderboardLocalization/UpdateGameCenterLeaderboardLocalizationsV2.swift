import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Leaderboard Localization

     Update a specific Game Center leaderboard localization.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardLocalizationsV2(id: String,
                                                           requestBody: GameCenterLeaderboardLocalizationV2UpdateRequest) -> Request<GameCenterLeaderboardLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Achievement Localization

     Update a specific Game Center achievement localization.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementLocalizationsV2(id: String,
                                                           requestBody: GameCenterAchievementLocalizationV2UpdateRequest) -> Request<GameCenterAchievementLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

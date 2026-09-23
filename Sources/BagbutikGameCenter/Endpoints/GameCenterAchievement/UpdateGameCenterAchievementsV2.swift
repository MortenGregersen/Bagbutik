import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Achievement

     Update a specific Game Center achievement.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementsV2(id: String,
                                               requestBody: GameCenterAchievementV2UpdateRequest) -> Request<GameCenterAchievementV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

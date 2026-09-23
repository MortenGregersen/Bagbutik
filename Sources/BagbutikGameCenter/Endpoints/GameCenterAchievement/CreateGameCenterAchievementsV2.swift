import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Game Center Achievement

     Create a Game Center achievement.

     ## Overview

     - 201:
     - 400:
     - 401:
     - 403:
     - 409:
     - 422:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterAchievements>

     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementsV2(requestBody: GameCenterAchievementV2CreateRequest) -> Request<GameCenterAchievementV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements",
            method: .post,
            requestBody: requestBody)
    }
}

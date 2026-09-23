import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Game Center Leaderboard Set Localization

     Create a Game Center leaderboard set localization.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSetLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetLocalizationsV2(requestBody: GameCenterLeaderboardSetLocalizationV2CreateRequest) -> Request<GameCenterLeaderboardSetLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

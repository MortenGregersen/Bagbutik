import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get All Image IDs for a Game Center Leaderboard Localization

     Get a list of image resource IDs for a specific Game Center leaderboard localization.

     ## Overview

     - id:
     - 200:
     - 400:
     - 401:
     - 403:
     - 404:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterLeaderboardLocalizationsV2(id: String) -> Request<GameCenterLeaderboardLocalizationV2ImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)/relationships/image",
            method: .get)
    }
}

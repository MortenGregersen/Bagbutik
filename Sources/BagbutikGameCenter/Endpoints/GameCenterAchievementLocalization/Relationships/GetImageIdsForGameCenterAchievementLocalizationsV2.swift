import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get All Image IDs for a Game Center Achievement Localization

     Get a list of image resource IDs for a specific Game Center achievement localization.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievementLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterAchievementLocalizationsV2(id: String) -> Request<GameCenterAchievementLocalizationV2ImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations/\(id)/relationships/image",
            method: .get)
    }
}

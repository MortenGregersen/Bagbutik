import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get All Localization IDs for a Game Center Achievement Version

     Get a list of localization resource IDs for a specific Game Center achievement version.

     ## Overview

     - id:
     - limit:
     - 200:
     - 400:
     - 401:
     - 403:
     - 404:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievementVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForGameCenterAchievementVersionsV2(id: String,
                                                                      limit: Int? = nil) -> Request<GameCenterAchievementVersionV2LocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

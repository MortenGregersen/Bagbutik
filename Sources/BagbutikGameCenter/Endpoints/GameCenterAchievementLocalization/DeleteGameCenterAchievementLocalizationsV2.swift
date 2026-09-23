import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete a Game Center Achievement Localization

     Delete a specific Game Center achievement localization.

     ## Overview

     - id:
     - 204:
     - 400:
     - 401:
     - 403:
     - 404:
     - 409:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterAchievementLocalizationsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations/\(id)",
            method: .delete)
    }
}

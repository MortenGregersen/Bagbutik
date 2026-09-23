import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the Activity for a Game Center Achievement

     Update the activity relationship for a specific Game Center achievement.

     ## Overview

     - id:
     - 204:
     - 401:
     - 403:
     - 404:
     - 409:
     - 422:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievements-_id_-relationships-activity>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateActivityForGameCenterAchievementsV2(id: String,
                                                          requestBody: GameCenterAchievementV2ActivityLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements/\(id)/relationships/activity",
            method: .patch,
            requestBody: requestBody)
    }
}

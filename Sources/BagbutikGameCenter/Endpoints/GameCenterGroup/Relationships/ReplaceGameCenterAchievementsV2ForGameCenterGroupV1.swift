import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the Achievements for a Game Center Group

     Update the achievements relationship for a specific Game Center group.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_-relationships-gameCenterAchievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterAchievementsV2ForGameCenterGroupV1(id: String,
                                                                    requestBody: GameCenterGroupGameCenterAchievementsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterAchievementsV2",
            method: .patch,
            requestBody: requestBody)
    }
}

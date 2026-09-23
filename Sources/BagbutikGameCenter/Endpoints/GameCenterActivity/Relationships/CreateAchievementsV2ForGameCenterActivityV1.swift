import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Add an Achievement to a Game Center Activity

     Add an achievement to a Game Center activity.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities-_id_-relationships-achievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAchievementsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityAchievementsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/achievementsV2",
            method: .post,
            requestBody: requestBody)
    }
}

import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Remove a Leaderboard

     Remove a leaderboard from a Game Center activity.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_-relationships-leaderboardsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteLeaderboardsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityLeaderboardsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/leaderboardsV2",
            method: .delete,
            requestBody: requestBody)
    }
}

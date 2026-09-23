import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Add a Leaderboard to a Game Center Leaderboard Set

     Add a leaderboard to a Game Center leaderboard set.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSets-_id_-relationships-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardsForGameCenterLeaderboardSetsV2(id: String,
                                                                           requestBody: GameCenterLeaderboardSetV2GameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards",
            method: .post,
            requestBody: requestBody)
    }
}

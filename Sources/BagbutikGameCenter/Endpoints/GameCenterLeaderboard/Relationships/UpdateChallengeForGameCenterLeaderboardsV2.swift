import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the Challenge for a Game Center Leaderboard

     Update the challenge relationship for a specific Game Center leaderboard.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboards-_id_-relationships-challenge>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateChallengeForGameCenterLeaderboardsV2(id: String,
                                                           requestBody: GameCenterLeaderboardV2ChallengeLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/relationships/challenge",
            method: .patch,
            requestBody: requestBody)
    }
}

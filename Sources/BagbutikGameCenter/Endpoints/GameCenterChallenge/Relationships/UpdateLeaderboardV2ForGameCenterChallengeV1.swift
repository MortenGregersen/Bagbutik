import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the Leaderboard for a Game Center Challenge

     Update the leaderboard relationship for a specific Game Center challenge.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallenges-_id_-relationships-leaderboardV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateLeaderboardV2ForGameCenterChallengeV1(id: String,
                                                            requestBody: GameCenterChallengeLeaderboardV2LinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)/relationships/leaderboardV2",
            method: .patch,
            requestBody: requestBody)
    }
}

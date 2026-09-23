import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List Score Moderation IDs for a Game Center Leaderboard

     List the score moderation IDs for a Game Center leaderboard.

     ## Overview

     The response contains the score moderations’ resource identifiers in a [`GameCenterLeaderboardV2GameCenterScoreModerationsLinkagesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterLeaderboardV2GameCenterScoreModerationsLinkagesResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboards-_id_-relationships-gameCenterScoreModerations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterScoreModerationIdsForGameCenterLeaderboardsV2(id: String,
                                                                            limit: Int? = nil) -> Request<GameCenterLeaderboardV2GameCenterScoreModerationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/relationships/gameCenterScoreModerations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

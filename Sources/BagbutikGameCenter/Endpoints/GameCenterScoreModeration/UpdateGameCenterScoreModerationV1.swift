import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Score Moderation

     Block or unblock a score submitted to a leaderboard.

     ## Overview

     Blocking a score removes it from the leaderboard, and unblocking reinstates it. The response contains the updated [`GameCenterScoreModeration`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModeration) in a [`GameCenterScoreModerationResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModerationResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterScoreModerations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterScoreModeration representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterScoreModerationV1(id: String,
                                                  requestBody: GameCenterScoreModerationUpdateRequest) -> Request<GameCenterScoreModerationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterScoreModerations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

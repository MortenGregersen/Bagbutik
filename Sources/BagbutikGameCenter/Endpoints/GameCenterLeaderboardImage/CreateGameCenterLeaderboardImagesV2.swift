import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Game Center Leaderboard Image

     Create a Game Center leaderboard image.

     ## Overview

     - 201:
     - 400:
     - 401:
     - 403:
     - 409:
     - 422:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardImages>

     - Parameter requestBody: GameCenterLeaderboardImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardImagesV2(requestBody: GameCenterLeaderboardImageV2CreateRequest) -> Request<GameCenterLeaderboardImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardImages",
            method: .post,
            requestBody: requestBody)
    }
}

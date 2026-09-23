import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Achievement Image

     Update a specific Game Center achievement image.

     ## Overview

     - id:
     - 200:
     - 400:
     - 401:
     - 403:
     - 404:
     - 409:
     - 422:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievementImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementImagesV2(id: String,
                                                    requestBody: GameCenterAchievementImageV2UpdateRequest) -> Request<GameCenterAchievementImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

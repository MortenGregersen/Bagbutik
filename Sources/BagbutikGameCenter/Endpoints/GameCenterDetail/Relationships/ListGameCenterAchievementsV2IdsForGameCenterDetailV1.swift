import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get All Achievement IDs for a Game Center Detail

     Get a list of achievement resource IDs for a specific Game Center detail.

     ## Overview

     - id:
     - limit:
     - 200:
     - 400:
     - 401:
     - 403:
     - 404:
     - 429:

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterAchievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementsV2IdsForGameCenterDetailV1(id: String,
                                                                     limit: Int? = nil) -> Request<GameCenterDetailGameCenterAchievementsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterAchievementsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}

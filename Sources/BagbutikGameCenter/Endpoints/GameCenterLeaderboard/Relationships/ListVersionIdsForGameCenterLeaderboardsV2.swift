import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get All Version IDs for a Game Center Leaderboard

     Get a list of version resource IDs for a specific Game Center leaderboard.

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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboards-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForGameCenterLeaderboardsV2(id: String,
                                                          limit: Int? = nil) -> Request<GameCenterLeaderboardV2VersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboards/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

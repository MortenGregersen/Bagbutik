import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List Blocked Player IDs

     List the blocked player IDs for a Game Center detail.

     ## Overview

     The response contains the blocked players’ resource identifiers in a [`GameCenterDetailBlockedPlayersLinkagesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailBlockedPlayersLinkagesResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-blockedPlayers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBlockedPlayerIdsForGameCenterDetailV1(id: String,
                                                          limit: Int? = nil) -> Request<GameCenterDetailBlockedPlayersLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/blockedPlayers",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Game Center Detail Player

     Block or unblock a player for a game.

     ## Overview> Tip:
     > These endpoints require information from GameKit, specifically <doc://com.apple.documentation/documentation/GameKit/GKPlayer/gamePlayerID>.

     Blocking a player prevents that player from playing the game. The response contains the updated [`GameCenterDetailPlayer`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayer) in a [`GameCenterDetailPlayerResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayerResponse).

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetailPlayers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterDetailPlayer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterDetailPlayerV1(id: String,
                                               requestBody: GameCenterDetailPlayerUpdateRequest) -> Request<GameCenterDetailPlayerResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetailPlayers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

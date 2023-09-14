import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center detail for an app
     Edit challenge state, default leaderboards, and groups.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_game_center_detail_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterDetailV1(id: String,
                                         requestBody: GameCenterDetailUpdateRequest) -> Request<GameCenterDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}

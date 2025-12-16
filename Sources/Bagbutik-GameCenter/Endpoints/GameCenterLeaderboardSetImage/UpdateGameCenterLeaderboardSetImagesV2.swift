import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard set image
     Update a specific Game Center leaderboard set image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardSetImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetImagesV2(id: String,
                                                       requestBody: GameCenterLeaderboardSetImageV2UpdateRequest) -> Request<GameCenterLeaderboardSetImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

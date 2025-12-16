import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center achievement image
     Update a specific Game Center achievement image.

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

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an achievement image
     Commit an achievement image after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievementImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementImageV1(id: String,
                                                   requestBody: GameCenterAchievementImageUpdateRequest) -> Request<GameCenterAchievementImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementImages/\(id)", method: .patch, requestBody: requestBody)
    }
}

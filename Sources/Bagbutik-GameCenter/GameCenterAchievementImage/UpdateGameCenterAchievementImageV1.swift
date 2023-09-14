import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an achievement image
     Commit an achievement image after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_achievement_image>

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

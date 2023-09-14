import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an achievement image
     Add a new achievement image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_achievement_image>

     - Parameter requestBody: GameCenterAchievementImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementImageV1(requestBody: GameCenterAchievementImageCreateRequest) -> Request<GameCenterAchievementImageResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievementImages", method: .post, requestBody: requestBody)
    }
}

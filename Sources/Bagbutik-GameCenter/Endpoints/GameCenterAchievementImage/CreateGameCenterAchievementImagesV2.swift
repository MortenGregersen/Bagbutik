import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center achievement image
     Create a Game Center achievement image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterAchievementImages>

     - Parameter requestBody: GameCenterAchievementImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementImagesV2(requestBody: GameCenterAchievementImageV2CreateRequest) -> Request<GameCenterAchievementImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementImages",
            method: .post,
            requestBody: requestBody)
    }
}

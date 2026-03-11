import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an achievement image
     Add a new achievement image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAchievementImages>

     - Parameter requestBody: GameCenterAchievementImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterAchievementImageV1(requestBody: GameCenterAchievementImageCreateRequest) -> Request<GameCenterAchievementImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementImages",
            method: .post,
            requestBody: requestBody)
    }
}

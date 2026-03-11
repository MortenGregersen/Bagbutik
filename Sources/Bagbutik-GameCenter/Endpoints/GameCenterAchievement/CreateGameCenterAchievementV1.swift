import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an achievement
     Add an achievement to a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAchievements>

     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterAchievementV1(requestBody: GameCenterAchievementCreateRequest) -> Request<GameCenterAchievementResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements",
            method: .post,
            requestBody: requestBody)
    }
}

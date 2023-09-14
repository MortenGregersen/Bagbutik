import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an achievement
     Add an achievement to a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_achievement>

     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementV1(requestBody: GameCenterAchievementCreateRequest) -> Request<GameCenterAchievementResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievements", method: .post, requestBody: requestBody)
    }
}

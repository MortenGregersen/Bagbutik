import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center achievement release
     Create a release for an achievement and a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAchievementReleases>

     - Parameter requestBody: GameCenterAchievementRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementReleaseV1(requestBody: GameCenterAchievementReleaseCreateRequest) -> Request<GameCenterAchievementReleaseResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievementReleases", method: .post, requestBody: requestBody)
    }
}

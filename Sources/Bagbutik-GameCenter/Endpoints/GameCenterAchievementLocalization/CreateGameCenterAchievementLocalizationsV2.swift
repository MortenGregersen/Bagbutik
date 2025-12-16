import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center achievement localization
     Create a Game Center achievement localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterAchievementLocalizations>

     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementLocalizationsV2(requestBody: GameCenterAchievementLocalizationV2CreateRequest) -> Request<GameCenterAchievementLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

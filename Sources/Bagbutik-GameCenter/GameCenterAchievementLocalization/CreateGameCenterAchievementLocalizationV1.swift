import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an achievement localization
     Add Game Center achievement localized information for a new locale.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_achievement_localization>

     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAchievementLocalizationV1(requestBody: GameCenterAchievementLocalizationCreateRequest) -> Request<GameCenterAchievementLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievementLocalizations", method: .post, requestBody: requestBody)
    }
}

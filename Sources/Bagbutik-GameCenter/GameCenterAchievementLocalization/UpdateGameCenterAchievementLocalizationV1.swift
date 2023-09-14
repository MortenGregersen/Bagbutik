import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit an achievement localization
     Modify localized Game Center achievement information for a particular language.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_an_achievement_localization>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementLocalizationV1(id: String,
                                                          requestBody: GameCenterAchievementLocalizationUpdateRequest) -> Request<GameCenterAchievementLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

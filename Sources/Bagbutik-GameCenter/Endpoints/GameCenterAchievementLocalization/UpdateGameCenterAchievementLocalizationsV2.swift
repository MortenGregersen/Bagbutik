import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center achievement localization
     Update a specific Game Center achievement localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAchievementLocalizationsV2(id: String,
                                                           requestBody: GameCenterAchievementLocalizationV2UpdateRequest) -> Request<GameCenterAchievementLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

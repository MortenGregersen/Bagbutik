import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the achievement ID for a  localization
     Read the achievement ID associated with specific localized information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_-relationships-gameCenterAchievement>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterAchievementIdsForGameCenterAchievementLocalizationV1(id: String) -> Request<GameCenterAchievementLocalizationGameCenterAchievementLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)/relationships/gameCenterAchievement",
            method: .get)
    }
}

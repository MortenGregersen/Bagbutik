import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all image IDs for a Game Center achievement localization
     Get a list of image resource IDs for a specific Game Center achievement localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievementLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterAchievementLocalizationsV2(id: String) -> Request<GameCenterAchievementLocalizationV2ImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementLocalizations/\(id)/relationships/image",
            method: .get)
    }
}

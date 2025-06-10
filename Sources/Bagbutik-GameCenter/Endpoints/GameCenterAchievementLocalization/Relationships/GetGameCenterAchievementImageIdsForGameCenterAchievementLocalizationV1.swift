import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterAchievementLocalizations/{id}/relationships/gameCenterAchievementImage

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_-relationships-gameCenterAchievementImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementImageIdsForGameCenterAchievementLocalizationV1(id: String) -> Request<GameCenterAchievementLocalizationGameCenterAchievementImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)/relationships/gameCenterAchievementImage",
            method: .get)
    }
}

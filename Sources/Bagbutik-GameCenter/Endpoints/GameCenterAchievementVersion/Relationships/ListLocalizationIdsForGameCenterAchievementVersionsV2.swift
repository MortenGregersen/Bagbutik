import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all localization IDs for a Game Center achievement version
     Get a list of localization resource IDs for a specific Game Center achievement version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievementVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForGameCenterAchievementVersionsV2(id: String,
                                                                      limit: Int? = nil) -> Request<GameCenterAchievementVersionV2LocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievementVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

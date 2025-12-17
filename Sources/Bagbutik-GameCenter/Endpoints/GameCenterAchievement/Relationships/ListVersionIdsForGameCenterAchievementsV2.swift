import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all version IDs for a Game Center achievement
     Get a list of version resource IDs for a specific Game Center achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievements-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForGameCenterAchievementsV2(id: String,
                                                          limit: Int? = nil) -> Request<GameCenterAchievementV2VersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

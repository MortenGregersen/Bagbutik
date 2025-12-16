import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all localization IDs for a Game Center leaderboard version
     Get a list of localization resource IDs for a specific Game Center leaderboard version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForGameCenterLeaderboardVersionsV2(id: String,
                                                                      limit: Int? = nil) -> Request<GameCenterLeaderboardVersionV2LocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

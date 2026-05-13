import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All Localization IDs for a Game Center Leaderboard Set Version
     Get a list of localization resource IDs for a specific Game Center leaderboard set version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSetVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForGameCenterLeaderboardSetVersionsV2(id: String,
                                                                         limit: Int? = nil) -> Request<GameCenterLeaderboardSetVersionV2LocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}

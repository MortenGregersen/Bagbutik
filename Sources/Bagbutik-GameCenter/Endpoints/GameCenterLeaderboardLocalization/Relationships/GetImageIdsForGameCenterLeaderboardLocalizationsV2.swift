import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All Image IDs for a Game Center Leaderboard Localization
     Get a list of image resource IDs for a specific Game Center leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterLeaderboardLocalizationsV2(id: String) -> Request<GameCenterLeaderboardLocalizationV2ImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)/relationships/image",
            method: .get)
    }
}

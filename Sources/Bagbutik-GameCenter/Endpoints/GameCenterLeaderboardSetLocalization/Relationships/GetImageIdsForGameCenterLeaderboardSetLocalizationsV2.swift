import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get all image IDs for a Game Center leaderboard set localization
     Get a list of image resource IDs for a specific Game Center leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSetLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterLeaderboardSetLocalizationsV2(id: String) -> Request<GameCenterLeaderboardSetLocalizationV2ImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations/\(id)/relationships/image",
            method: .get)
    }
}

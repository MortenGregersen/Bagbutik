import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the leaderboard image ID for a Game Center leaderboard localization

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardLocalizations-_id_-relationships-gameCenterLeaderboardImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterLeaderboardImageIdsForGameCenterLeaderboardLocalizationV1(id: String) -> Request<GameCenterLeaderboardLocalizationGameCenterLeaderboardImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardLocalizations/\(id)/relationships/gameCenterLeaderboardImage",
            method: .get)
    }
}

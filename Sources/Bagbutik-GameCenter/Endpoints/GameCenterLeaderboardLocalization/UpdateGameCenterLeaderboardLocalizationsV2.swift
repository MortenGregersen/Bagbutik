import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard localization
     Update a specific Game Center leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardLocalizationsV2(id: String,
                                                           requestBody: GameCenterLeaderboardLocalizationV2UpdateRequest) -> Request<GameCenterLeaderboardLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

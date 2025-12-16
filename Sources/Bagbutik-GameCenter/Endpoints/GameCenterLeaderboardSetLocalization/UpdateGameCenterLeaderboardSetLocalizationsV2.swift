import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard set localization
     Update a specific Game Center leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardSetLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetLocalizationsV2(id: String,
                                                              requestBody: GameCenterLeaderboardSetLocalizationV2UpdateRequest) -> Request<GameCenterLeaderboardSetLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

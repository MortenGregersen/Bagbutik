import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a leaderboard localization
     Edit a leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardLocalizationV1(id: String,
                                                          requestBody: GameCenterLeaderboardLocalizationUpdateRequest) -> Request<GameCenterLeaderboardLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

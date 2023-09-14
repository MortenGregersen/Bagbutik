import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a leaderboard set localization
     Edit a leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_leaderboard_set_localization>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetLocalizationV1(id: String,
                                                             requestBody: GameCenterLeaderboardSetLocalizationUpdateRequest) -> Request<GameCenterLeaderboardSetLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

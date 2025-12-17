import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard set localization
     Create a Game Center leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardSetLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetLocalizationsV2(requestBody: GameCenterLeaderboardSetLocalizationV2CreateRequest) -> Request<GameCenterLeaderboardSetLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

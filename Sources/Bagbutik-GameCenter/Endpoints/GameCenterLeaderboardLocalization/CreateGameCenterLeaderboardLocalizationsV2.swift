import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Game Center leaderboard localization
     Create a Game Center leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-gameCenterLeaderboardLocalizations>

     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardLocalizationsV2(requestBody: GameCenterLeaderboardLocalizationV2CreateRequest) -> Request<GameCenterLeaderboardLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}

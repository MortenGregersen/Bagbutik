import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard localization
     Add a new leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardLocalizations>

     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardLocalizationV1(requestBody: GameCenterLeaderboardLocalizationCreateRequest) -> Request<GameCenterLeaderboardLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardLocalizations", method: .post, requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard set localization
     Add a new leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetLocalizationV1(requestBody: GameCenterLeaderboardSetLocalizationCreateRequest) -> Request<GameCenterLeaderboardSetLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSetLocalizations", method: .post, requestBody: requestBody)
    }
}

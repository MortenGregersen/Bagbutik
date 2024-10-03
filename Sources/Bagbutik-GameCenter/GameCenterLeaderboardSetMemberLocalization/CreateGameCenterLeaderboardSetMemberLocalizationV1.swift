import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard set member localization
     Add a new leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetMemberLocalizations>

     - Parameter requestBody: GameCenterLeaderboardSetMemberLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardSetMemberLocalizationV1(requestBody: GameCenterLeaderboardSetMemberLocalizationCreateRequest) -> Request<GameCenterLeaderboardSetMemberLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSetMemberLocalizations", method: .post, requestBody: requestBody)
    }
}

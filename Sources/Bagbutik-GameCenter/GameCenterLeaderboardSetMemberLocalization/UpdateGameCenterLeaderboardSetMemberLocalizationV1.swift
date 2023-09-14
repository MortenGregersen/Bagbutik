import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a leaderboard set member localization
     Edit a leaderboard set member localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_leaderboard_set_member_localization>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetMemberLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetMemberLocalizationV1(id: String,
                                                                   requestBody: GameCenterLeaderboardSetMemberLocalizationUpdateRequest) -> Request<GameCenterLeaderboardSetMemberLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSetMemberLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}

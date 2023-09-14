import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a leaderboard set member localization
     Delete a localization that’s associated with a leaderboard set member.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_leaderboard_set_member_localization>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardSetMemberLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSetMemberLocalizations/\(id)", method: .delete)
    }
}

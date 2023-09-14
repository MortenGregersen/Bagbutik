import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the relationship between a leaderboard and a group leaderboard
     Modify the group leadboard to which a leaderboard belongs.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_the_relationship_between_a_leaderboard_and_a_group_leaderboard>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGroupLeaderboardForGameCenterLeaderboardV1(id: String,
                                                                 requestBody: GameCenterLeaderboardGroupLeaderboardLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboards/\(id)/relationships/groupLeaderboard", method: .patch, requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the releationship between a leaderboard and a group leaderboard
     Modify the group leaderboards in a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_the_releationship_between_a_leaderboard_and_a_group_leaderboard>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGroupLeaderboardSetForGameCenterLeaderboardSetV1(id: String,
                                                                       requestBody: GameCenterLeaderboardSetGroupLeaderboardSetLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/groupLeaderboardSet", method: .patch, requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the releationship between a leaderboard and a group leaderboard
     Modify the group leaderboards in a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSets-_id_-relationships-groupLeaderboardSet>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGroupLeaderboardSetForGameCenterLeaderboardSetV1(id: String,
                                                                       requestBody: GameCenterLeaderboardSetGroupLeaderboardSetLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/groupLeaderboardSet", method: .patch, requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the relationship between a leaderboard and a group leaderboard
     Modify the group leadboard to which a leaderboard belongs.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboards-_id_-relationships-groupLeaderboard>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGroupLeaderboardForGameCenterLeaderboardV1(id: String,
                                                                 requestBody: GameCenterLeaderboardGroupLeaderboardLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboards/\(id)/relationships/groupLeaderboard", method: .patch, requestBody: requestBody)
    }
}

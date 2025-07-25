import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the group leaderboard set in a leaderboard set
     List all the group leaderboard sets in a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSets-_id_-relationships-groupLeaderboardSet>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGroupLeaderboardSetIdsForGameCenterLeaderboardSetV1(id: String) -> Request<GameCenterLeaderboardSetGroupLeaderboardSetLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/groupLeaderboardSet",
            method: .get)
    }
}

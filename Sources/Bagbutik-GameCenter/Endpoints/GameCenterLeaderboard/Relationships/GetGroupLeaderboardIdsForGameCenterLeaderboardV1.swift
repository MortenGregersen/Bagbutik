import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all groups to which a leaderboard belongs 
     List associated group leaderboards for a specific leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboards-_id_-relationships-groupLeaderboard>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGroupLeaderboardIdsForGameCenterLeaderboardV1(id: String) -> Request<GameCenterLeaderboardGroupLeaderboardLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards/\(id)/relationships/groupLeaderboard",
            method: .get)
    }
}

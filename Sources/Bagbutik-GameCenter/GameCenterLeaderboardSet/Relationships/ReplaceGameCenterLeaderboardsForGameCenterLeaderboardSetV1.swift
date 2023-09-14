import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Edit the relationship between a leaderboard and a leaderboard set
     Modify the leaderboards in leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/edit_the_relationship_between_a_leaderboard_and_a_leaderboard_set>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardsForGameCenterLeaderboardSetV1(id: String,
                                                                           requestBody: GameCenterLeaderboardSetGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards", method: .patch, requestBody: requestBody)
    }
}

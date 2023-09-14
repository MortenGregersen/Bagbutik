import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a relationship between a leaderboard and a leaderboard set
     Add a leaderboard to a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_relationship_between_a_leaderboard_and_a_leaderboard_set>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardsForGameCenterLeaderboardSetV1(id: String,
                                                                          requestBody: GameCenterLeaderboardSetGameCenterLeaderboardsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/gameCenterLeaderboards", method: .post, requestBody: requestBody)
    }
}

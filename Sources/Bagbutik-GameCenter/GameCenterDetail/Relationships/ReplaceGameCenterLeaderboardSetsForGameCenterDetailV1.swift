import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the associated leaderboard sets for a Game Center detail
     Edit the associated leaderboard sets for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_associated_leaderboard_sets_for_a_game_center_detail>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterLeaderboardSetsForGameCenterDetailV1(id: String,
                                                                      requestBody: GameCenterDetailGameCenterLeaderboardSetsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterLeaderboardSets", method: .patch, requestBody: requestBody)
    }
}

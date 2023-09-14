import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a leaderboard
     Delete a leaderboard from your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_leaderboard>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboards/\(id)", method: .delete)
    }
}

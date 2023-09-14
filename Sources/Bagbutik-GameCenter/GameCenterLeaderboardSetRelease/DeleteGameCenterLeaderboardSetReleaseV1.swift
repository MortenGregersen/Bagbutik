import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a leaderboard set release
     Delete a new leaderboard set release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_leaderboard_set_release>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardSetReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSetReleases/\(id)", method: .delete)
    }
}

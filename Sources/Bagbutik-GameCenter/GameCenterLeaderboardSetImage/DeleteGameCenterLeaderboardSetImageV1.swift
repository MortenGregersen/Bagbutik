import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a leaderboard set image
     Delete an image that’s associated with a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterLeaderboardSetImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardSetImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardSetImages/\(id)", method: .delete)
    }
}

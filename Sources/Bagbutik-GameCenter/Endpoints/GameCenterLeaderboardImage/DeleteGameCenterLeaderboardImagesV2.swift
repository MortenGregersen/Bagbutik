import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Game Center leaderboard image
     Delete a specific Game Center leaderboard image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-gameCenterLeaderboardImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterLeaderboardImagesV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardImages/\(id)",
            method: .delete)
    }
}

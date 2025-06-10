import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Game Center achievement release
     Delete a release of an achievement or Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterAchievementReleases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterAchievementReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementReleases/\(id)",
            method: .delete)
    }
}

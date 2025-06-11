import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an activity version release
     Remove a specific version release from a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivityVersionReleases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterActivityVersionReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersionReleases/\(id)",
            method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a challenge version release
     Remove a specific version release from a Game Center challenge version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterChallengeVersionReleases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterChallengeVersionReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersionReleases/\(id)",
            method: .delete)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/builds/{id}/relationships/preReleaseVersion

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-preReleaseVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPreReleaseVersionIdsForBuildV1(id: String) -> Request<BuildPreReleaseVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/preReleaseVersion",
            method: .get)
    }
}

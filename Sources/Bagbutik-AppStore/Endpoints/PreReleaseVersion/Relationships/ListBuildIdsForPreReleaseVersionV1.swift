import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/preReleaseVersions/{id}/relationships/builds

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-preReleaseVersions-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildIdsForPreReleaseVersionV1(id: String,
                                                   limit: Int? = nil) -> Request<PrereleaseVersionBuildsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/preReleaseVersions/\(id)/relationships/builds",
            method: .get,
            parameters: .init(limit: limit))
    }
}

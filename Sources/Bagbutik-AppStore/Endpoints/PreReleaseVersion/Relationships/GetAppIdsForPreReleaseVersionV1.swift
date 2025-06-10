import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/preReleaseVersions/{id}/relationships/app

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-preReleaseVersions-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForPreReleaseVersionV1(id: String) -> Request<PrereleaseVersionAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/preReleaseVersions/\(id)/relationships/app",
            method: .get)
    }
}

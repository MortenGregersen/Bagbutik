import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciBuildActions/{id}/relationships/buildRun

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-relationships-buildRun>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildRunIdsForCiBuildActionV1(id: String) -> Request<CiBuildActionBuildRunLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/relationships/buildRun",
            method: .get)
    }
}

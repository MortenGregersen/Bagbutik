import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciBuildActions/{id}/relationships/artifacts

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-relationships-artifacts>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listArtifactIdsForCiBuildActionV1(id: String,
                                                  limit: Int? = nil) -> Request<CiBuildActionArtifactsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/relationships/artifacts",
            method: .get,
            parameters: .init(limit: limit))
    }
}

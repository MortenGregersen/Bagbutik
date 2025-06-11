import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciWorkflows/{id}/relationships/buildRuns

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciWorkflows-_id_-relationships-buildRuns>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildRunIdsForCiWorkflowV1(id: String,
                                               limit: Int? = nil) -> Request<CiWorkflowBuildRunsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)/relationships/buildRuns",
            method: .get,
            parameters: .init(limit: limit))
    }
}

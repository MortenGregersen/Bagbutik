import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciProducts/{id}/relationships/workflows

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_-relationships-workflows>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listWorkflowIdsForCiProductV1(id: String,
                                              limit: Int? = nil) -> Request<CiProductWorkflowsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)/relationships/workflows",
            method: .get,
            parameters: .init(limit: limit))
    }
}

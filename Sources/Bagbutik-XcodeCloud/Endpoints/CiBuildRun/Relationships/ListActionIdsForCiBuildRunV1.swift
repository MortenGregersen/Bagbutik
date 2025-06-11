import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciBuildRuns/{id}/relationships/actions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildRuns-_id_-relationships-actions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActionIdsForCiBuildRunV1(id: String,
                                             limit: Int? = nil) -> Request<CiBuildRunActionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildRuns/\(id)/relationships/actions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciBuildActions/{id}/relationships/issues

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-relationships-issues>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIssueIdsForCiBuildActionV1(id: String,
                                               limit: Int? = nil) -> Request<CiBuildActionIssuesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/relationships/issues",
            method: .get,
            parameters: .init(limit: limit))
    }
}

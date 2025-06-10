import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciBuildActions/{id}/relationships/testResults

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-relationships-testResults>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTestResultIdsForCiBuildActionV1(id: String,
                                                    limit: Int? = nil) -> Request<CiBuildActionTestResultsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/relationships/testResults",
            method: .get,
            parameters: .init(limit: limit))
    }
}

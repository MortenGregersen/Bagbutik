import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the repository ID for a CI workflow

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciWorkflows-_id_-relationships-repository>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRepositoryIdsForCiWorkflowV1(id: String) -> Request<CiWorkflowRepositoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)/relationships/repository",
            method: .get)
    }
}

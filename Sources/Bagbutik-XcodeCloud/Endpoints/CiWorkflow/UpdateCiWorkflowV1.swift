import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Update an Xcode Cloud Workflow
     Make changes to an Xcode Cloud workflow.

     The example request below updates the name of an existing Xcode Cloud workflow. For a successful update, the response includes detailed information about the workflow. Use it to access additional information, start a new build, and so on.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-ciWorkflows-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: CiWorkflow representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateCiWorkflowV1(id: String,
                                   requestBody: CiWorkflowUpdateRequest) -> Request<CiWorkflowResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

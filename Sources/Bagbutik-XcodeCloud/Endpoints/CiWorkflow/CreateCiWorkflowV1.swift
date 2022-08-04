import Bagbutik_Core

public extension Request {
    /**
     # Create a Workflow
     Create a new Xcode Cloud workflow for an Xcode Cloud product.

     The example request below creates a new workflow that performs the archive action. App Store Connect returns the `201` HTTP status code to indicate the successful creation of the workflow and returns information about the workflow. Use the data to access additional information or to start a new build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_workflow>

     - Parameter requestBody: CiWorkflow representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCiWorkflowV1(requestBody: CiWorkflowCreateRequest) -> Request<CiWorkflowResponse, ErrorResponse> {
        .init(path: "/v1/ciWorkflows", method: .post, requestBody: requestBody)
    }
}

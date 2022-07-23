public extension Request {
    /**
      # Create a Workflow
      Create a new Xcode Cloud workflow for an Xcode Cloud product.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_workflow>

      The example request below creates a new workflow that performs the archive action. App Store Connect returns the `201` HTTP status code to indicate the successful creation of the workflow and returns information about the workflow. Use the data to access additional information or to start a new build.

      - Parameter requestBody: CiWorkflow representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createCiWorkflowV1(requestBody: CiWorkflowCreateRequest) -> Request<CiWorkflowResponse, ErrorResponse> {
        return .init(path: "/v1/ciWorkflows", method: .post, requestBody: requestBody)
    }
}

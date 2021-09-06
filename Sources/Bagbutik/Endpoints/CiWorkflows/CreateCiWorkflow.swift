public extension Request {
    /**
      # Create a Workflow
      Create a new Xcode Cloud workflow for an Xcode Cloud product.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_workflow>

      - Parameter requestBody: CiWorkflow representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createCiWorkflow(requestBody: CiWorkflowCreateRequest) -> Request<CiWorkflowResponse, ErrorResponse> {
        return .init(path: "/v1/ciWorkflows", method: .post, requestBody: requestBody)
    }
}

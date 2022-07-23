public extension Request {
    /**
      # Update an Xcode Cloud Workflow
      Make changes to an Xcode Cloud workflow.

      The example request below updates the name of an existing Xcode Cloud workflow. For a successful update, the response includes detailed information about the workflow. Use it to access additional information, start a new build, and so on.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/update_an_xcode_cloud_workflow>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: CiWorkflow representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateCiWorkflowV1(id: String,
                                   requestBody: CiWorkflowUpdateRequest) -> Request<CiWorkflowResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciWorkflows/\(id)", method: .patch, requestBody: requestBody)
    }
}

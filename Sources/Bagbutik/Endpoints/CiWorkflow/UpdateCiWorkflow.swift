public extension Request {
    /**
      # Update an Xcode Cloud Workflow
      Make changes to an Xcode Cloud workflow.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/update_an_xcode_cloud_workflow>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: CiWorkflow representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateCiWorkflow(id: String,
                                 requestBody: CiWorkflowUpdateRequest) -> Request<CiWorkflowResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciWorkflows/\(id)", method: .patch, requestBody: requestBody)
    }
}

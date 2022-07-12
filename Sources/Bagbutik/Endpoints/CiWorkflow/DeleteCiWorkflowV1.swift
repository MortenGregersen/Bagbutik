public extension Request {
    /**
      # Delete a Workflow
      Delete an Xcode Cloud workflow and all of its associated data.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_workflow>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteCiWorkflowV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/ciWorkflows/\(id)", method: .delete)
    }
}

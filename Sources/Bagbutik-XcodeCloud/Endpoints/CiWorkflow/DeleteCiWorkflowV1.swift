public extension Request {
    /**
     # Delete a Workflow
     Delete an Xcode Cloud workflow and all of its associated data.

     To delete an Xcode Cloud workflow, call this endpoint using the HTTP `DELETE` method like this:
     ```
     https://api.appstoreconnect.apple.com/v1/ciWorkflows/9ad354b0-f380-40d3-b94f-dd5225b8b3d5
     ```
     App Store Connect confirms the deletion by responding with the `HTTP/1.1 204 No Content` HTTP status code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_workflow>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCiWorkflowV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/ciWorkflows/\(id)", method: .delete)
    }
}

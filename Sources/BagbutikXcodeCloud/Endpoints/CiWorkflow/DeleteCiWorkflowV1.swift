import BagbutikCore
import BagbutikModelsShared
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Delete a workflow

     Delete an Xcode Cloud workflow and all of its associated data.

     ## Discussion

     To delete an Xcode Cloud workflow, call this endpoint using the HTTP `DELETE` method like this:

     ```swift
     https://api.appstoreconnect.apple.com/v1/ciWorkflows/9ad354b0-f380-40d3-b94f-dd5225b8b3d5
     ```

     App Store Connect confirms the deletion by responding with the `HTTP/1.1 204 No Content` HTTP status code.

     > Important:
     > Deleting an Xcode Cloud workflow permanently deletes its build history and artifacts. Only delete an Xcode Cloud workflow when you’re confident that you no longer need it and its build history or artifacts. Instead of deleting a workflow, deactivate it to preserve its build history and artifacts. To deactivate a workflow, use the ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/PATCH-v1-ciWorkflows-_id_`` endpoint to set the workflow’s `isEnabled` attribute to `false` or deactivate it in the Xcode or App Store Connect. For more information about deactivating a workflow using Xcode or App Store Connect, see <doc://com.apple.documentation/documentation/Xcode/Developing-a-Workflow-Strategy-for-Xcode-Cloud>.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-ciWorkflows-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCiWorkflowV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)",
            method: .delete)
    }
}

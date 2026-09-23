import BagbutikCore
import BagbutikModelsShared
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Delete a product

     Delete an Xcode Cloud product and all of its associated workflows, builds, and artifacts.

     ## Discussion

     To delete an Xcode Cloud product, call this endpoint using the HTTP `DELETE` method like this:

     ```swift
     https://api.appstoreconnect.apple.com/v1/ciProducts/9ad354b0-f380-40d3-b94f-dd5225b8b3d5
     ```

     App Store Connect confirms the deletion by responding with the `HTTP/1.1 204 No Content` HTTP status code.

     > Important:
     > Deleting an Xcode Cloud product permanently deletes all workflows, including their build history and artifacts. Only delete an Xcode Cloud product when you’re confident that you don’t need its workflows, build history, or artifacts anymore. Instead of deleting a product, deactivate its workflows to preserve the product and its build history and artifacts. For more information about deactivating a workflow, see <doc://com.apple.documentation/documentation/Xcode/Developing-a-Workflow-Strategy-for-Xcode-Cloud>.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-ciProducts-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCiProductV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)",
            method: .delete)
    }
}

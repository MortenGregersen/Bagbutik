import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the build upload file id for a build upload

     Get the build upload file ID for a specific build upload.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildUploads-_id_-relationships-buildUploadFiles>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildUploadFileIdsForBuildUploadV1(id: String,
                                                       limit: Int? = nil) -> Request<BuildUploadBuildUploadFilesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploads/\(id)/relationships/buildUploadFiles",
            method: .get,
            parameters: .init(limit: limit))
    }
}

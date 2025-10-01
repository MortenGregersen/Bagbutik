import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit a build upload file
     Commit a build upload file to a specific build upload.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-buildUploadFiles-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BuildUploadFile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBuildUploadFileV1(id: String,
                                        requestBody: BuildUploadFileUpdateRequest) -> Request<BuildUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploadFiles/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

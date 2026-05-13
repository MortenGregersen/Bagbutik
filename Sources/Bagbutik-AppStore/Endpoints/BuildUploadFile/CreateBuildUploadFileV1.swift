import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Reservation for a Build Upload File
     Reserve a build upload file for a specific build upload.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-buildUploadFiles>

     - Parameter requestBody: BuildUploadFile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildUploadFileV1(requestBody: BuildUploadFileCreateRequest) -> Request<BuildUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploadFiles",
            method: .post,
            requestBody: requestBody)
    }
}

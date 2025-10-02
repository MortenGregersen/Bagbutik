import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a build upload
     Add a new build upload to an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-buildUploads>

     - Parameter requestBody: BuildUpload representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildUploadV1(requestBody: BuildUploadCreateRequest) -> Request<BuildUploadResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploads",
            method: .post,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a build upload
     Remove a specific build upload for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-buildUploads-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBuildUploadV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploads/\(id)",
            method: .delete)
    }
}

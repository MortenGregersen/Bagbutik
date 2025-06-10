import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Event Video Clip
     Delete a specific video clip from an in-app event.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appEventVideoClips-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventVideoClipV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventVideoClips/\(id)",
            method: .delete)
    }
}

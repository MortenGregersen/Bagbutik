import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Preview
     Delete an app preview within a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appPreviews-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppPreviewV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviews/\(id)",
            method: .delete)
    }
}

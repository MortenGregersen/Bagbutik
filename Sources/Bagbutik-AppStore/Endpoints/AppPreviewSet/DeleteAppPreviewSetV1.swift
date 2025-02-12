import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Preview Set
     Delete an app preview set and all of its previews.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appPreviewSets-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppPreviewSetV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appPreviewSets/\(id)", method: .delete)
    }
}

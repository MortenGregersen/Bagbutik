import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a PassTypeId
     Delete a pass type ID that is used for app distribution.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-passTypeIds-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deletePassTypeIdV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds/\(id)",
            method: .delete)
    }
}

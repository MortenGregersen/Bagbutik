import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a PassTypeId
     Update a specific pass type ID’s name.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-passTypeIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: PassTypeId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updatePassTypeIdV1(id: String,
                                   requestBody: PassTypeIdUpdateRequest) -> Request<PassTypeIdResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

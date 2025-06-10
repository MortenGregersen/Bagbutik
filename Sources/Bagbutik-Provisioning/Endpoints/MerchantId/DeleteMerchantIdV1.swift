import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a merchant ID
     Delete a specific merchant ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-merchantIds-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteMerchantIdV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds/\(id)",
            method: .delete)
    }
}

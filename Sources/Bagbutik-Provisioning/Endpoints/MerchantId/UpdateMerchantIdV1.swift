import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify merchant IDs
     Update a specific merchant ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-merchantIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MerchantId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateMerchantIdV1(id: String,
                                   requestBody: MerchantIdUpdateRequest) -> Request<MerchantIdResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

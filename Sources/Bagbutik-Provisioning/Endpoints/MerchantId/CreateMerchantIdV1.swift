import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a merchant ID
     Add a new merchant ID to your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-merchantIds>

     - Parameter requestBody: MerchantId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMerchantIdV1(requestBody: MerchantIdCreateRequest) -> Request<MerchantIdResponse, ErrorResponse> {
        .init(path: "/v1/merchantIds", method: .post, requestBody: requestBody)
    }
}

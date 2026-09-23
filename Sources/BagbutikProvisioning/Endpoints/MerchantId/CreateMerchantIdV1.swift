import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Create a merchant id

     Add a new merchant ID to your team.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-merchantIds>

     - Parameter requestBody: MerchantId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMerchantIdV1(requestBody: MerchantIdCreateRequest) -> Request<MerchantIdResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds",
            method: .post,
            requestBody: requestBody)
    }
}

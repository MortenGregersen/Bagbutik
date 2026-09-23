import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Create a passtypeid

     Create a new identifier for use with a pass type ID certificate using a certificate signing request.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-passTypeIds>

     - Parameter requestBody: PassTypeId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createPassTypeIdV1(requestBody: PassTypeIdCreateRequest) -> Request<PassTypeIdResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds",
            method: .post,
            requestBody: requestBody)
    }
}

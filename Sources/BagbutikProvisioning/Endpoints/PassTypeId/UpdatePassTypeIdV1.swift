import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Modify a passtypeid

     Update a specific pass type ID’s name.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

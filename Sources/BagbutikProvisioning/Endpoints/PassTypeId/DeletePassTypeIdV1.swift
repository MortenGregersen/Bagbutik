import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels

public extension Request {
    /**
     # Delete a passtypeid

     Delete a pass type ID that is used for app distribution.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

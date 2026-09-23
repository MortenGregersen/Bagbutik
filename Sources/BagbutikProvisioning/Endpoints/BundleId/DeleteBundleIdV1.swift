import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels

public extension Request {
    /**
     # Delete a bundle id

     ## Discussion

     You can only delete bundle IDs that are used for development. You can’t delete bundle IDs that are being used by an app in App Store Connect.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-bundleIds-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBundleIdV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)",
            method: .delete)
    }
}

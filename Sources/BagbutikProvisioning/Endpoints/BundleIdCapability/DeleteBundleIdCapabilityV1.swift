import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels

public extension Request {
    /**
     # Disable a capability

     Disable a capability for a bundle ID.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-bundleIdCapabilities-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBundleIdCapabilityV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIdCapabilities/\(id)",
            method: .delete)
    }
}

import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Modify a capability configuration

     Update the configuration of a specific capability.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-bundleIdCapabilities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BundleIdCapability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBundleIdCapabilityV1(id: String,
                                           requestBody: BundleIdCapabilityUpdateRequest) -> Request<BundleIdCapabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIdCapabilities/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}

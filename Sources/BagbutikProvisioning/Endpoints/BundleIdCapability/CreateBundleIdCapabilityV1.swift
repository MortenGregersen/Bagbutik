import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Enable a capability

     Enable a capability for a bundle ID.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-bundleIdCapabilities>

     - Parameter requestBody: BundleIdCapability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBundleIdCapabilityV1(requestBody: BundleIdCapabilityCreateRequest) -> Request<BundleIdCapabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIdCapabilities",
            method: .post,
            requestBody: requestBody)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Enable a Capability
     Enable a capability for a bundle ID.

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

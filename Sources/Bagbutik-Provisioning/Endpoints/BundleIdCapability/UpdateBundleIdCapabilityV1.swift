import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Capability Configuration
     Update the configuration of a specific capability.

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

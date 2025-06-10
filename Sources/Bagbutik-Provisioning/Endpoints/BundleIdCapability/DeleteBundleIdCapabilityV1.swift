import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Disable a Capability
     Disable a capability for a bundle ID.

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

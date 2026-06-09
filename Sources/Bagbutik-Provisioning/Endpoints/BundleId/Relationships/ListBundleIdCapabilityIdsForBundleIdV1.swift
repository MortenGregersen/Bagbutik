import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read bundle Id capabilities ids for a bundle Id
     List all bundleIdCapabilities IDs for a specific bundle Id.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-bundleIds-_id_-relationships-bundleIdCapabilities>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBundleIdCapabilityIdsForBundleIdV1(id: String,
                                                       limit: Int? = nil) -> Request<BundleIdBundleIdCapabilitiesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)/relationships/bundleIdCapabilities",
            method: .get,
            parameters: .init(limit: limit))
    }
}

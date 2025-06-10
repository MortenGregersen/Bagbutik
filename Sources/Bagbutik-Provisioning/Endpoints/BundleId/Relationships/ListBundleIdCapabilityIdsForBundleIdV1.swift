import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/bundleIds/{id}/relationships/bundleIdCapabilities

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

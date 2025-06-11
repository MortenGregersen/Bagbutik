import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/bundleIds/{id}/relationships/profiles

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-bundleIds-_id_-relationships-profiles>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listProfileIdsForBundleIdV1(id: String,
                                            limit: Int? = nil) -> Request<BundleIdProfilesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)/relationships/profiles",
            method: .get,
            parameters: .init(limit: limit))
    }
}

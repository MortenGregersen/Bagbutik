import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/bundleIds/{id}/relationships/app

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-bundleIds-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBundleIdV1(id: String) -> Request<BundleIdAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)/relationships/app",
            method: .get)
    }
}

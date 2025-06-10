import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/profiles/{id}/relationships/bundleId

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-profiles-_id_-relationships-bundleId>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBundleIdIdsForProfileV1(id: String) -> Request<ProfileBundleIdLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)/relationships/bundleId",
            method: .get)
    }
}

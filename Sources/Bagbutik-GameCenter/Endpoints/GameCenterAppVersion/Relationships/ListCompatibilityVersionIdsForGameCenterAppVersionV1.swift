import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read compatible app versions
     List all compatible verisons for an app version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAppVersions-_id_-relationships-compatibilityVersions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCompatibilityVersionIdsForGameCenterAppVersionV1(id: String,
                                                                     limit: Int? = nil) -> Request<GameCenterAppVersionCompatibilityVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAppVersions/\(id)/relationships/compatibilityVersions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersions/{id}/relationships/gameCenterAppVersion

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-gameCenterAppVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAppVersionIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionGameCenterAppVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/gameCenterAppVersion",
            method: .get)
    }
}

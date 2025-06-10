import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterAppVersions/{id}/relationships/appStoreVersion

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAppVersions-_id_-relationships-appStoreVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionIdsForGameCenterAppVersionV1(id: String) -> Request<GameCenterAppVersionAppStoreVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAppVersions/\(id)/relationships/appStoreVersion",
            method: .get)
    }
}

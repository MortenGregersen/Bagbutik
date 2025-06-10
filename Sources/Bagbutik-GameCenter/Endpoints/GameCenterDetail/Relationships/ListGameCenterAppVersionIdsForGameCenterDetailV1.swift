import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterDetails/{id}/relationships/gameCenterAppVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterAppVersions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAppVersionIdsForGameCenterDetailV1(id: String,
                                                                 limit: Int? = nil) -> Request<GameCenterDetailGameCenterAppVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterAppVersions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

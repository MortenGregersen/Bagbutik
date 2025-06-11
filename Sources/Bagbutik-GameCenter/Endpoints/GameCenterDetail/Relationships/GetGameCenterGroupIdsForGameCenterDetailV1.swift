import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterDetails/{id}/relationships/gameCenterGroup

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterGroup>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterGroupIdsForGameCenterDetailV1(id: String) -> Request<GameCenterDetailGameCenterGroupLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterGroup",
            method: .get)
    }
}

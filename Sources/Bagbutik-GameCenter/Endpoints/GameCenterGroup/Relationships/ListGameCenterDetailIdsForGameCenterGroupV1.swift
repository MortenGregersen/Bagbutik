import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterGroups/{id}/relationships/gameCenterDetails

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterDetails>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterDetailIdsForGameCenterGroupV1(id: String,
                                                            limit: Int? = nil) -> Request<GameCenterGroupGameCenterDetailsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterDetails",
            method: .get,
            parameters: .init(limit: limit))
    }
}

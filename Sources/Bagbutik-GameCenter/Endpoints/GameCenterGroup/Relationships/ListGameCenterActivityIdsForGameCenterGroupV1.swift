import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterGroups/{id}/relationships/gameCenterActivities

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterActivities>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterActivityIdsForGameCenterGroupV1(id: String,
                                                              limit: Int? = nil) -> Request<GameCenterGroupGameCenterActivitiesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterActivities",
            method: .get,
            parameters: .init(limit: limit))
    }
}

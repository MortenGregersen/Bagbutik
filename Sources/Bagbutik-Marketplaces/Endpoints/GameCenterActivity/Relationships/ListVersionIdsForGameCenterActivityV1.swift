import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterActivities/{id}/relationships/versions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivities-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForGameCenterActivityV1(id: String,
                                                      limit: Int? = nil) -> Request<GameCenterActivityVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}

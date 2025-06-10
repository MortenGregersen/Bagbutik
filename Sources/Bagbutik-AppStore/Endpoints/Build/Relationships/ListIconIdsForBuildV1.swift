import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/builds/{id}/relationships/icons

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-icons>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIconIdsForBuildV1(id: String,
                                      limit: Int? = nil) -> Request<BuildIconsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/icons",
            method: .get,
            parameters: .init(limit: limit))
    }
}

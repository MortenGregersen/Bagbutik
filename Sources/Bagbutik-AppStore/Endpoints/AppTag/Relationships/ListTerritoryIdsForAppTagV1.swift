import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List territory Ids for an app tag
     List territory IDs for an app tag.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appTags-_id_-relationships-territories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryIdsForAppTagV1(id: String,
                                            limit: Int? = nil) -> Request<AppTagTerritoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appTags/\(id)/relationships/territories",
            method: .get,
            parameters: .init(limit: limit))
    }
}

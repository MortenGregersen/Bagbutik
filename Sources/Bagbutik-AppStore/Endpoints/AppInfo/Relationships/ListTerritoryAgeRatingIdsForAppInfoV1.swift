import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List territory age rating Ids for an app info
     List all territory age rating IDs for a specific app info.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-territoryAgeRatings>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryAgeRatingIdsForAppInfoV1(id: String,
                                                      limit: Int? = nil) -> Request<AppInfoTerritoryAgeRatingsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/territoryAgeRatings",
            method: .get,
            parameters: .init(limit: limit))
    }
}

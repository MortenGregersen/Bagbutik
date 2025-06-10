import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/appAvailabilities/{id}/relationships/territoryAvailabilities

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-appAvailabilities-_id_-relationships-territoryAvailabilities>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryAvailabilityIdsForAppAvailabilitiesV2(id: String,
                                                                   limit: Int? = nil) -> Request<AppAvailabilityV2TerritoryAvailabilitiesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/appAvailabilities/\(id)/relationships/territoryAvailabilities",
            method: .get,
            parameters: .init(limit: limit))
    }
}

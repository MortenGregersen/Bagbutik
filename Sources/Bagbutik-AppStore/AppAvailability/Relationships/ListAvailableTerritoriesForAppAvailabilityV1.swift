import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List territory availability for an app
     List all the territories where an app is available.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_territory_availability_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAvailableTerritoriesForAppAvailabilityV1(id: String,
                                                             fields: [ListAvailableTerritoriesForAppAvailabilityV1.Field]? = nil,
                                                             limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse>
    {
        .init(path: "/v1/appAvailabilities/\(id)/availableTerritories", method: .get, parameters: .init(fields: fields,
                                                                                                        limit: limit))
    }
}

public enum ListAvailableTerritoriesForAppAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }
}

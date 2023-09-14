import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Availablity Territories
     Read the territory availablity for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_availablity_territories>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryAvailabilitiesForAppAvailabilitiesV2V2(id: String,
                                                                    fields: [ListTerritoryAvailabilitiesForAppAvailabilitiesV2V2.Field]? = nil,
                                                                    includes: [ListTerritoryAvailabilitiesForAppAvailabilitiesV2V2.Include]? = nil,
                                                                    limit: Int? = nil) -> Request<TerritoryAvailabilitiesResponse, ErrorResponse>
    {
        .init(path: "/v2/appAvailabilities/\(id)/territoryAvailabilities", method: .get, parameters: .init(fields: fields,
                                                                                                           includes: includes,
                                                                                                           limit: limit))
    }
}

public enum ListTerritoryAvailabilitiesForAppAvailabilitiesV2V2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])
        /// The fields to include for returned resources of type territoryAvailabilities
        case territoryAvailabilities([TerritoryAvailabilities])

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }

        public enum TerritoryAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case available
            case contentStatuses
            case preOrderEnabled
            case preOrderPublishDate
            case releaseDate
            case territory
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}

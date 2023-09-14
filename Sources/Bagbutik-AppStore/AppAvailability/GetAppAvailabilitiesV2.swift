import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Availabilty
     Get information about your app’s availalbility.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_availabilty>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related territoryAvailabilities returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppAvailabilitiesV2(id: String,
                                       fields: [GetAppAvailabilitiesV2.Field]? = nil,
                                       includes: [GetAppAvailabilitiesV2.Include]? = nil,
                                       limit: Int? = nil) -> Request<AppAvailabilityV2Response, ErrorResponse>
    {
        .init(path: "/v2/appAvailabilities/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                   includes: includes,
                                                                                   limit: limit))
    }
}

public enum GetAppAvailabilitiesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAvailabilities
        case appAvailabilities([AppAvailabilities])
        /// The fields to include for returned resources of type territoryAvailabilities
        case territoryAvailabilities([TerritoryAvailabilities])

        public enum AppAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case app
            case availableInNewTerritories
            case territoryAvailabilities
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
        case territoryAvailabilities
    }
}

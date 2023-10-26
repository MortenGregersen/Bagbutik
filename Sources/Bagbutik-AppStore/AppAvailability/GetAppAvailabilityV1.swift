import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the availability for an app
     Get a list of availabilities for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_availability_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppAvailabilityV1(id: String,
                                     fields: [GetAppAvailabilityV1.Field]? = nil,
                                     includes: [GetAppAvailabilityV1.Include]? = nil,
                                     limit: Int? = nil) -> Request<AppAvailabilityResponse, ErrorResponse>
    {
        .init(path: "/v1/appAvailabilities/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                   includes: includes,
                                                                                   limit: limit))
    }
}

public enum GetAppAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAvailabilities
        case appAvailabilities([AppAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case app
            case availableInNewTerritories
            case availableTerritories
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case availableTerritories
    }
}

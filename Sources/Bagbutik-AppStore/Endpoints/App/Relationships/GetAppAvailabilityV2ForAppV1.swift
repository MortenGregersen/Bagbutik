import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List availability for an app
     Get a list of availabilities for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-appAvailabilityV2>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related territoryAvailabilities returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppAvailabilityV2ForAppV1(id: String,
                                             fields: [GetAppAvailabilityV2ForAppV1.Field]? = nil,
                                             includes: [GetAppAvailabilityV2ForAppV1.Include]? = nil,
                                             limit: GetAppAvailabilityV2ForAppV1.Limit? = nil) -> Request<AppAvailabilityV2Response, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/appAvailabilityV2",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAppAvailabilityV2ForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAvailabilities
        case appAvailabilities([AppAvailabilities])
        /// The fields to include for returned resources of type territoryAvailabilities
        case territoryAvailabilities([TerritoryAvailabilities])

        public enum AppAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case territoryAvailabilities
        }

        public enum TerritoryAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
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

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related territoryAvailabilities returned (when they are included) - maximum 50
        case territoryAvailabilities(Int)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read an app's price schedule information
     List the price schedule details for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPriceScheduleV1(id: String,
                                      fields: [GetAppPriceScheduleV1.Field]? = nil,
                                      includes: [GetAppPriceScheduleV1.Include]? = nil,
                                      limits: [GetAppPriceScheduleV1.Limit]? = nil) -> Request<AppPriceScheduleResponse, ErrorResponse>
    {
        .init(path: "/v1/appPriceSchedules/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                   includes: includes,
                                                                                   limits: limits))
    }
}

public enum GetAppPriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPriceSchedules
        case appPriceSchedules([AppPriceSchedules])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case automaticPrices
            case baseTerritory
            case manualPrices
        }

        public enum AppPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case automaticPrices
        case baseTerritory
        case manualPrices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related automaticPrices returned (when they are included) - maximum 50
        case automaticPrices(Int)
        /// Maximum number of related manualPrices returned (when they are included) - maximum 50
        case manualPrices(Int)
    }
}

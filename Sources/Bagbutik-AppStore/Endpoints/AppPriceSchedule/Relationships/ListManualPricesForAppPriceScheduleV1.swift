import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List manually chosen prices for an app
     List the prices you chose for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_-manualPrices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listManualPricesForAppPriceScheduleV1(id: String,
                                                      fields: [ListManualPricesForAppPriceScheduleV1.Field]? = nil,
                                                      filters: [ListManualPricesForAppPriceScheduleV1.Filter]? = nil,
                                                      includes: [ListManualPricesForAppPriceScheduleV1.Include]? = nil,
                                                      limit: Int? = nil) -> Request<AppPricesV2Response, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules/\(id)/manualPrices",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListManualPricesForAppPriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'endDate'
        case endDate([String])
        /// Filter by attribute 'startDate'
        case startDate([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPricePoint
        case territory
    }
}

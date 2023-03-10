import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List automatically generated prices for an app
     List the automatically calculated prices for an app generated from a base territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_automatically_generated_prices_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAutomaticPricesForAppPriceScheduleV1(id: String,
                                                         fields: [ListAutomaticPricesForAppPriceScheduleV1.Field]? = nil,
                                                         filters: [ListAutomaticPricesForAppPriceScheduleV1.Filter]? = nil,
                                                         includes: [ListAutomaticPricesForAppPriceScheduleV1.Include]? = nil,
                                                         limit: Int? = nil) -> Request<AppPricesV2Response, ErrorResponse>
    {
        .init(path: "/v1/appPriceSchedules/\(id)/automaticPrices", method: .get, parameters: .init(fields: fields,
                                                                                                   filters: filters,
                                                                                                   includes: includes,
                                                                                                   limit: limit))
    }
}

public enum ListAutomaticPricesForAppPriceScheduleV1 {
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

        public enum AppPricePoints: String, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory
        }

        public enum AppPrices: String, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case appPricePoint
        case territory
    }
}

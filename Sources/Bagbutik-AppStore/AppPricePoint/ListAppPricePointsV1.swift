import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List App Price Points
     List all app price points available in App Store Connect, including related price tier, developer proceeds, and territory.

     Use this endpoint to retrieve the customer price and proceeds earned for each App Store price point in the currency of any App Store territory.
     The data returned by this endpoint is equivalent to the information you find when you log in to App Store Connect and view [All Prices and Currencies](https://appstoreconnect.apple.com/apps/pricingmatrix).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_app_price_points>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listAppPricePointsV1(fields: [ListAppPricePointsV1.Field]? = nil,
                                     filters: [ListAppPricePointsV1.Filter]? = nil,
                                     includes: [ListAppPricePointsV1.Include]? = nil,
                                     limit: Int? = nil) -> Request<AppPricePointsResponse, ErrorResponse>
    {
        .init(path: "/v1/appPricePoints", method: .get, parameters: .init(fields: fields,
                                                                          filters: filters,
                                                                          includes: includes,
                                                                          limit: limit))
    }
}

public enum ListAppPricePointsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case priceTier
            case proceeds
            case territory
        }

        public enum Territories: String, ParameterValue, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'priceTier'
        case priceTier([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case priceTier
        case territory
    }
}

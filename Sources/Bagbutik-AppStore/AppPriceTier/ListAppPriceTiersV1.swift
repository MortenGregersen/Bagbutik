import Bagbutik_Models

public extension Request {
    /**
     # List App Price Tiers
     List all app price tiers available in App Store Connect.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_app_price_tiers>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPriceTiersV1(fields: [ListAppPriceTiersV1.Field]? = nil,
                                    filters: [ListAppPriceTiersV1.Filter]? = nil,
                                    includes: [ListAppPriceTiersV1.Include]? = nil,
                                    limits: [ListAppPriceTiersV1.Limit]? = nil) -> Request<AppPriceTiersResponse, ErrorResponse>
    {
        .init(path: "/v1/appPriceTiers", method: .get, parameters: .init(fields: fields,
                                                                         filters: filters,
                                                                         includes: includes,
                                                                         limits: limits))
    }
}

public enum ListAppPriceTiersV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPriceTiers
        case appPriceTiers([AppPriceTiers])

        public enum AppPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case priceTier
            case proceeds
            case territory
        }

        public enum AppPriceTiers: String, ParameterValue, CaseIterable {
            case pricePoints
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case pricePoints
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related pricePoints returned (when they are included) - maximum 50
        case pricePoints(Int)
    }
}

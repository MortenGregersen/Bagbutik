public extension Request {
    /**
      # List App Price Tiers
      List all app price tiers available in App Store Connect, including related price points.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_app_price_tiers>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPriceTiers(fields: [ListAppPriceTiers.Field]? = nil,
                                  filters: [ListAppPriceTiers.Filter]? = nil,
                                  includes: [ListAppPriceTiers.Include]? = nil,
                                  limits: [ListAppPriceTiers.Limit]? = nil) -> Request<AppPriceTiersResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPriceTiers", method: .get, parameters: .init(fields: fields,
                                                                                filters: filters,
                                                                                includes: includes,
                                                                                limits: limits))
    }
}

public enum ListAppPriceTiers {
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

public extension Request {
    /**
      # List All Price Points for an App Price Tier
      List price points across all App Store territories for a specific price tier.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_price_points_for_an_app_price_tier>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listPricePointsForAppPriceTier(id: String,
                                               fields: [ListPricePointsForAppPriceTier.Field]? = nil,
                                               filters: [ListPricePointsForAppPriceTier.Filter]? = nil,
                                               includes: [ListPricePointsForAppPriceTier.Include]? = nil,
                                               limit: Int? = nil) -> Request<AppPricePointsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPriceTiers/\(id)/pricePoints", method: .get, parameters: .init(fields: fields,
                                                                                                  filters: filters,
                                                                                                  includes: includes,
                                                                                                  limit: limit))
    }
}

public enum ListPricePointsForAppPriceTier {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPriceTiers
        case appPriceTiers([AppPriceTiers])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case priceTier
            case proceeds
            case territory
        }

        public enum AppPriceTiers: String, ParameterValue, CaseIterable {
            case pricePoints
        }

        public enum Territories: String, ParameterValue, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case priceTier, territory
    }
}

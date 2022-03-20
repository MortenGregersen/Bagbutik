public extension Request {
    /**
      # Read App Price Tier Information
      Read available app price tiers.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_tier_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related pricePoints returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppPriceTier(id: String,
                                fields: [GetAppPriceTier.Field]? = nil,
                                includes: [GetAppPriceTier.Include]? = nil,
                                limit: Int? = nil) -> Request<AppPriceTierResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPriceTiers/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}

public enum GetAppPriceTier {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case pricePoints
    }
}

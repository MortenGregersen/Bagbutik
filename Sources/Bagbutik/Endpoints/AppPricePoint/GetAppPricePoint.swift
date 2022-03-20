public extension Request {
    /**
      # Read App Price Point Information
      Read the customer prices and your proceeds for a price tier.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_point_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppPricePoint(id: String,
                                 fields: [GetAppPricePoint.Field]? = nil,
                                 includes: [GetAppPricePoint.Include]? = nil) -> Request<AppPricePointResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPricePoints/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes))
    }
}

public enum GetAppPricePoint {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case priceTier, territory
    }
}

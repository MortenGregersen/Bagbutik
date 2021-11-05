public extension Request {
    /**
      # List All Prices for an App
      Get current price tier of an app and any future planned price changes.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_prices_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPricesForApp(id: String,
                                 fields: [ListPricesForApp.Field]? = nil,
                                 limit: Int? = nil) -> Request<AppPricesResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                                    limit: limit))
    }
}

public enum ListPricesForApp {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])

        public enum AppPrices: String, ParameterValue, CaseIterable {
            case app
            case priceTier
        }
    }
}

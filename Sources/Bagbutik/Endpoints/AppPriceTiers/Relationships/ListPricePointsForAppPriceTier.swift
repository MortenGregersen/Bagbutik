public extension Request {
    enum ListPricePointsForAppPriceTier {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appPricePoints
            case appPricePoints([AppPricePoints])

            public enum AppPricePoints: String, ParameterValue, CaseIterable {
                case customerPrice
                case priceTier
                case proceeds
                case territory
            }
        }
    }

    /**
      # List All Price Points for an App Price Tier
      List price points across all App Store territories for a specific price tier.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_price_points_for_an_app_price_tier>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPricePointsForAppPriceTier(id: String,
                                               fields: [ListPricePointsForAppPriceTier.Field]? = nil,
                                               limit: Int? = nil) -> Request<AppPricePointsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPriceTiers/\(id)/pricePoints", method: .get, parameters: .init(fields: fields,
                                                                                                  limit: limit))
    }
}

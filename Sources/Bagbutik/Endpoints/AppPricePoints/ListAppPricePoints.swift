public extension Request {
    enum ListAppPricePoints {
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
            case priceTier, territory
        }
    }

    /**
      # List App Price Points
      List all app price points available in App Store Connect, including related price tier, developer proceeds, and territory.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_app_price_points>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPricePoints(fields: [ListAppPricePoints.Field]? = nil,
                                   filters: [ListAppPricePoints.Filter]? = nil,
                                   includes: [ListAppPricePoints.Include]? = nil,
                                   limit: Int? = nil) -> Request<AppPricePointsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPricePoints", method: .get, parameters: .init(fields: fields,
                                                                                 filters: filters,
                                                                                 includes: includes,
                                                                                 limit: limit))
    }
}

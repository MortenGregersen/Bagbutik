public extension Request {
    enum GetTerritoryForAppPricePoint {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type territories
            case territories([Territories])

            public enum Territories: String, ParameterValue, CaseIterable {
                case currency
            }
        }
    }

    /**
      # Read the Territory Information of an App Price Point
      Get the territory in which a specific price point applies.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_territory_information_of_an_app_price_point>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getTerritoryForAppPricePoint(id: String,
                                             fields: [GetTerritoryForAppPricePoint.Field]? = nil) -> Request<TerritoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPricePoints/\(id)/territory", method: .get, parameters: .init(fields: fields))
    }
}

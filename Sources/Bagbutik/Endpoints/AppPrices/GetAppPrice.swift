public extension Request {
    enum GetAppPrice {
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

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app, priceTier
        }
    }

    /**
      # Read App Price Information
      Read current price and scheduled price changes for an app, including price tier and start date.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppPrice(id: String,
                            fields: [GetAppPrice.Field]? = nil,
                            includes: [GetAppPrice.Include]? = nil) -> Request<AppPriceResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPrices/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                  includes: includes))
    }
}

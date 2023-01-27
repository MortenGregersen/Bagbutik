import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Price Information
     Read current price and scheduled price changes for an app, including price tier and start date.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPriceV1(id: String,
                              fields: [GetAppPriceV1.Field]? = nil,
                              includes: [GetAppPriceV1.Include]? = nil) -> Request<AppPriceResponse, ErrorResponse>
    {
        .init(path: "/v1/appPrices/\(id)", method: .get, parameters: .init(fields: fields,
                                                                           includes: includes))
    }
}

public enum GetAppPriceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])

        public enum AppPrices: String, ParameterValue, Codable, CaseIterable {
            case app
            case priceTier
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
        case priceTier
    }
}

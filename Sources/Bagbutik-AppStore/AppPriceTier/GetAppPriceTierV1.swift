import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read app price tier information
     Read available app price tiers.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_tier_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related pricePoints returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppPriceTierV1(id: String,
                                  fields: [GetAppPriceTierV1.Field]? = nil,
                                  includes: [GetAppPriceTierV1.Include]? = nil,
                                  limit: Int? = nil) -> Request<AppPriceTierResponse, ErrorResponse>
    {
        .init(path: "/v1/appPriceTiers/\(id)", method: .get, parameters: .init(fields: fields,
                                                                               includes: includes,
                                                                               limit: limit))
    }
}

public enum GetAppPriceTierV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPriceTiers
        case appPriceTiers([AppPriceTiers])

        public enum AppPricePoints: String, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case priceTier
            case proceeds
            case territory
        }

        public enum AppPriceTiers: String, ParameterValue, Codable, CaseIterable {
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

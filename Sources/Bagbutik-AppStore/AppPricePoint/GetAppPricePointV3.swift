import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Price Point Information
     Read the customer prices and your proceeds for a price tier.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_price_point_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPricePointV3(id: String,
                                   fields: [GetAppPricePointV3.Field]? = nil,
                                   includes: [GetAppPricePointV3.Include]? = nil) -> Request<AppPricePointV3Response, ErrorResponse>
    {
        .init(path: "/v3/appPricePoints/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                includes: includes))
    }
}

public enum GetAppPricePointV3 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])

        public enum AppPricePoints: String, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
        case territory
    }
}

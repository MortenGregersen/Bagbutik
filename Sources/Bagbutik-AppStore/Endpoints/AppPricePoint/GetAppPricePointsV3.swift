import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read app price point information
     Get details about a specific app price point.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v3-appPricePoints-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPricePointsV3(id: String,
                                    fields: [GetAppPricePointsV3.Field]? = nil,
                                    includes: [GetAppPricePointsV3.Include]? = nil) -> Request<AppPricePointV3Response, ErrorResponse> {
        .init(
            path: "/v3/appPricePoints/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetAppPricePointsV3 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])

        public enum AppPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case equalizations
        case territory
    }
}

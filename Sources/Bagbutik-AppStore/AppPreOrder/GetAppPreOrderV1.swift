import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Pre-Order Information
     Get information about your app's pre-order configuration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_pre-order_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPreOrderV1(id: String,
                                 fields: [GetAppPreOrderV1.Field]? = nil,
                                 includes: [GetAppPreOrderV1.Include]? = nil) -> Request<AppPreOrderResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreOrders/\(id)", method: .get, parameters: .init(fields: fields,
                                                                              includes: includes))
    }
}

public enum GetAppPreOrderV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreOrders
        case appPreOrders([AppPreOrders])

        public enum AppPreOrders: String, ParameterValue, Codable, CaseIterable {
            case app
            case appReleaseDate
            case preOrderAvailableDate
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
    }
}

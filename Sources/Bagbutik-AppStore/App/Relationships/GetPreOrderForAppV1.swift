import Bagbutik_Models

public extension Request {
    /**
     # Read the Pre-Order Information of an App
     Get available date and release date of an app that is available for pre-order.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_pre-order_information_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPreOrderForAppV1(id: String,
                                    fields: [GetPreOrderForAppV1.Field]? = nil) -> Request<AppPreOrderResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/preOrder", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetPreOrderForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreOrders
        case appPreOrders([AppPreOrders])

        public enum AppPreOrders: String, ParameterValue, CaseIterable {
            case app
            case appReleaseDate
            case preOrderAvailableDate
        }
    }
}

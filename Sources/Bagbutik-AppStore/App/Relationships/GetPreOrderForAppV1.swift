import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Pre-Order Information of an App
     Get the available date and release date of an app that’s available for pre-order.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_pre-order_information_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getPreOrderForAppV1(id: String,
                                    fields: [GetPreOrderForAppV1.Field]? = nil) -> Request<AppPreOrderWithoutIncludesResponse, ErrorResponse>
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

        public enum AppPreOrders: String, ParameterValue, Codable, CaseIterable {
            case app
            case appReleaseDate
            case preOrderAvailableDate
        }
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read In-App Purchase Information
     Get information about an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related apps returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getInAppPurchaseV1(id: String,
                                   fields: [GetInAppPurchaseV1.Field]? = nil,
                                   includes: [GetInAppPurchaseV1.Include]? = nil,
                                   limit: GetInAppPurchaseV1.Limit? = nil) -> Request<InAppPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v1/inAppPurchases/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                includes: includes,
                                                                                limits: limit.map { [$0] }))
    }
}

public enum GetInAppPurchaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchases: String, ParameterValue, Codable, CaseIterable {
            case apps
            case inAppPurchaseType
            case productId
            case referenceName
            case state
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case apps
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related apps returned (when they are included) - maximum 50
        case apps(Int)
    }
}

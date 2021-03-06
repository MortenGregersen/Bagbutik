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
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getInAppPurchase(id: String,
                                 fields: [GetInAppPurchase.Field]? = nil,
                                 includes: [GetInAppPurchase.Include]? = nil,
                                 limit: Int? = nil) -> Request<InAppPurchaseResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchases/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes,
                                                                                       limit: limit))
    }
}

public enum GetInAppPurchase {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchases: String, ParameterValue, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case apps
    }
}

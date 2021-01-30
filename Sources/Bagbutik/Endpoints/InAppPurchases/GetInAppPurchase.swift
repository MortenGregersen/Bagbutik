public extension Request {
    enum GetInAppPurchase {
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

    /**
      # Read In-App Purchase Information
      Get information about an in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
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

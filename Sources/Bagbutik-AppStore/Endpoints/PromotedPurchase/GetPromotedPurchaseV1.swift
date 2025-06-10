import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Promoted Purchase Information
     Get details about a specific promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-promotedPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseV1(id: String,
                                      fields: [GetPromotedPurchaseV1.Field]? = nil,
                                      includes: [GetPromotedPurchaseV1.Include]? = nil) -> Request<PromotedPurchaseResponse, ErrorResponse> {
        .init(
            path: "/v1/promotedPurchases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetPromotedPurchaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchaseV2
        case subscription
    }
}

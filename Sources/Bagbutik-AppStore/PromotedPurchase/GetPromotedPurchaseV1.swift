import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Promoted Purchase Information
     Get details about a specific promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_promoted_purchase_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related promotionImages returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseV1(id: String,
                                      fields: [GetPromotedPurchaseV1.Field]? = nil,
                                      includes: [GetPromotedPurchaseV1.Include]? = nil,
                                      limit: GetPromotedPurchaseV1.Limit? = nil) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v1/promotedPurchases/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                   includes: includes,
                                                                                   limits: limit.map { [$0] }))
    }
}

public enum GetPromotedPurchaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchaseImages
        case promotedPurchaseImages([PromotedPurchaseImages])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

        public enum PromotedPurchaseImages: String, ParameterValue, Codable, CaseIterable {
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case promotedPurchase
            case sourceFileChecksum
            case state
            case uploadOperations
            case uploaded
        }

        public enum PromotedPurchases: String, ParameterValue, Codable, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
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
        case promotionImages
        case subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related promotionImages returned (when they are included) - maximum 50
        case promotionImages(Int)
    }
}

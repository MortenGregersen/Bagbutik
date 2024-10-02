import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get Promoted Purchase Image Information
     Get information about a specific image for a promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-promotedPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getPromotedPurchaseImageV1(id: String,
                                           fields: [GetPromotedPurchaseImageV1.Field]? = nil,
                                           includes: [GetPromotedPurchaseImageV1.Include]? = nil) -> Request<PromotedPurchaseImageResponse, ErrorResponse>
    {
        .init(path: "/v1/promotedPurchaseImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetPromotedPurchaseImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchaseImages
        case promotedPurchaseImages([PromotedPurchaseImages])

        public enum PromotedPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case promotedPurchase
    }
}

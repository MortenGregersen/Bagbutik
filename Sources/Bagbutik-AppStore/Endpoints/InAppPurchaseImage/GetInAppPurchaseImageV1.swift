import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase image information
     Read details about a specific in-app purchase image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseImageV1(id: String,
                                        fields: [GetInAppPurchaseImageV1.Field]? = nil,
                                        includes: [GetInAppPurchaseImageV1.Include]? = nil) -> Request<InAppPurchaseImageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseImages/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetInAppPurchaseImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseImages
        case inAppPurchaseImages([InAppPurchaseImages])

        public enum InAppPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case inAppPurchase
            case sourceFileChecksum
            case state
            case uploadOperations
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchase
    }
}

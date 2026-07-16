import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase image information
     Get the metadata for an in-app purchase image configured with the v2 API, including the asset upload state.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseImagesV2(id: String,
                                         fields: [GetInAppPurchaseImagesV2.Field]? = nil) -> Request<InAppPurchaseImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseImages/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetInAppPurchaseImagesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseImages
        case inAppPurchaseImages([InAppPurchaseImages])

        public enum InAppPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseImages(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseImages value: \(string)"
                    )
                }
            }
        }
    }
}

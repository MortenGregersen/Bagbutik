import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List images for an in-app purchase version
     List the review images attached to a draft version of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseVersions-_id_-images>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImagesForInAppPurchaseVersionV1(id: String,
                                                    fields: [ListImagesForInAppPurchaseVersionV1.Field]? = nil,
                                                    limit: Int? = nil) -> Request<InAppPurchaseImagesV2Response, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions/\(id)/images",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListImagesForInAppPurchaseVersionV1 {
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

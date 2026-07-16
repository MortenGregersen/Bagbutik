import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List images for a subscription version
     List the review images attached to a draft version of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionVersions-_id_-images>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImagesForSubscriptionVersionV1(id: String,
                                                   fields: [ListImagesForSubscriptionVersionV1.Field]? = nil,
                                                   limit: Int? = nil) -> Request<SubscriptionImagesV2Response, ErrorResponse> {
        .init(
            path: "/v1/subscriptionVersions/\(id)/images",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListImagesForSubscriptionVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionImages
        case subscriptionImages([SubscriptionImages])

        public enum SubscriptionImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionImages(rawValue: string) {
                    self = value
                } else if let value = SubscriptionImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionImages value: \(string)"
                    )
                }
            }
        }
    }
}

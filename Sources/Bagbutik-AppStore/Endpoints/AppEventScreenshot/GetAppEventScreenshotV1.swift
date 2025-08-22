import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List the images for an in-app event

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventScreenshotV1(id: String,
                                        fields: [GetAppEventScreenshotV1.Field]? = nil,
                                        includes: [GetAppEventScreenshotV1.Include]? = nil) -> Request<AppEventScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventScreenshots/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetAppEventScreenshotV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventScreenshots
        case appEventScreenshots([AppEventScreenshots])

        public enum AppEventScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventScreenshots(rawValue: string) {
                    self = value
                } else if let value = AppEventScreenshots(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventScreenshots value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appEventLocalization
    }
}

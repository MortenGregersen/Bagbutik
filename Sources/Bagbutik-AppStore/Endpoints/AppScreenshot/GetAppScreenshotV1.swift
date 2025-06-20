import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Screenshot Information
     Get information about an app screenshot and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppScreenshotV1(id: String,
                                   fields: [GetAppScreenshotV1.Field]? = nil,
                                   includes: [GetAppScreenshotV1.Include]? = nil) -> Request<AppScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshots/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetAppScreenshotV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])

        public enum AppScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appScreenshotSet
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appScreenshotSet
    }
}

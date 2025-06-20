import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Preview Information
     Get information about an app preview and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPreviews-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPreviewV1(id: String,
                                fields: [GetAppPreviewV1.Field]? = nil,
                                includes: [GetAppPreviewV1.Include]? = nil) -> Request<AppPreviewResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviews/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetAppPreviewV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])

        public enum AppPreviews: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSet
            case assetDeliveryState
            case fileName
            case fileSize
            case mimeType
            case previewFrameImage
            case previewFrameTimeCode
            case previewImage
            case sourceFileChecksum
            case uploadOperations
            case videoDeliveryState
            case videoUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPreviewSet
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Preview Set Information
     Get an app preview set that includes its display target, language, and the previews it contains.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_preview_set_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appPreviews returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPreviewSetV1(id: String,
                                   fields: [GetAppPreviewSetV1.Field]? = nil,
                                   includes: [GetAppPreviewSetV1.Include]? = nil,
                                   limit: Int? = nil) -> Request<AppPreviewSetResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreviewSets/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                includes: includes,
                                                                                limit: limit))
    }
}

public enum GetAppPreviewSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])

        public enum AppPreviewSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppPreviews: String, ParameterValue, CaseIterable {
            case appPreviewSet
            case assetDeliveryState
            case fileName
            case fileSize
            case mimeType
            case previewFrameTimeCode
            case previewImage
            case sourceFileChecksum
            case uploadOperations
            case uploaded
            case videoUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageLocalization
        case appPreviews
        case appStoreVersionExperimentTreatmentLocalization
        case appStoreVersionLocalization
    }
}

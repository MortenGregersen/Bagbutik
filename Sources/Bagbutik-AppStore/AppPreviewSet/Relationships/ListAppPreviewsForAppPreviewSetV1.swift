import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All App Previews for an App Preview Set
     List all ordered app previews in a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPreviewSets-_id_-appPreviews>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPreviewsForAppPreviewSetV1(id: String,
                                                  fields: [ListAppPreviewsForAppPreviewSetV1.Field]? = nil,
                                                  includes: [ListAppPreviewsForAppPreviewSetV1.Include]? = nil,
                                                  limit: Int? = nil) -> Request<AppPreviewsResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreviewSets/\(id)/appPreviews", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes,
                                                                                            limit: limit))
    }
}

public enum ListAppPreviewsForAppPreviewSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])

        public enum AppPreviewSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType
        }

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

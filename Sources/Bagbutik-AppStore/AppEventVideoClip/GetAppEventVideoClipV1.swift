import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEventVideoClips/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventvideoclips_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventVideoClipV1(id: String,
                                       fields: [GetAppEventVideoClipV1.Field]? = nil,
                                       includes: [GetAppEventVideoClipV1.Include]? = nil) -> Request<AppEventVideoClipResponse, ErrorResponse>
    {
        .init(path: "/v1/appEventVideoClips/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                    includes: includes))
    }
}

public enum GetAppEventVideoClipV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventVideoClips
        case appEventVideoClips([AppEventVideoClips])

        public enum AppEventVideoClips: String, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case fileName
            case fileSize
            case previewFrameTimeCode
            case previewImage
            case uploadOperations
            case uploaded
            case videoUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appEventLocalization
    }
}

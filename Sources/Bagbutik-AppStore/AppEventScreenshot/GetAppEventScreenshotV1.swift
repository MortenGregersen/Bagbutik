import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEventScreenshots/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventscreenshots_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventScreenshotV1(id: String,
                                        fields: [GetAppEventScreenshotV1.Field]? = nil,
                                        includes: [GetAppEventScreenshotV1.Include]? = nil) -> Request<AppEventScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/appEventScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
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

        public enum AppEventScreenshots: String, ParameterValue, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appEventLocalization
    }
}

public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventvideoclips_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppEventVideoClip(id: String,
                                     fields: [GetAppEventVideoClip.Field]? = nil,
                                     includes: [GetAppEventVideoClip.Include]? = nil) -> Request<AppEventVideoClipResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventVideoClips/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                           includes: includes))
    }
}

public enum GetAppEventVideoClip {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventVideoClips
        case appEventVideoClips([AppEventVideoClips])

        public enum AppEventVideoClips: String, ParameterValue, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case appEventLocalization
    }
}

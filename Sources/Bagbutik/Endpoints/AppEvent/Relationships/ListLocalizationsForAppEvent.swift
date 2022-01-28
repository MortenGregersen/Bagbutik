public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appevents_id_localizations>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listLocalizationsForAppEvent(id: String,
                                             fields: [ListLocalizationsForAppEvent.Field]? = nil,
                                             includes: [ListLocalizationsForAppEvent.Include]? = nil,
                                             limits: [ListLocalizationsForAppEvent.Limit]? = nil) -> Request<AppEventLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEvents/\(id)/localizations", method: .get, parameters: .init(fields: fields,
                                                                                                includes: includes,
                                                                                                limits: limits))
    }
}

public enum ListLocalizationsForAppEvent {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
        /// The fields to include for returned resources of type appEventScreenshots
        case appEventScreenshots([AppEventScreenshots])
        /// The fields to include for returned resources of type appEventVideoClips
        case appEventVideoClips([AppEventVideoClips])

        public enum AppEventLocalizations: String, ParameterValue, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case shortDescription
        }

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
        case appEvent, appEventScreenshots, appEventVideoClips
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appEventScreenshots returned (when they are included) - maximum 50
        case appEventScreenshots(Int)
        /// Maximum number of related appEventVideoClips returned (when they are included) - maximum 50
        case appEventVideoClips(Int)
    }
}

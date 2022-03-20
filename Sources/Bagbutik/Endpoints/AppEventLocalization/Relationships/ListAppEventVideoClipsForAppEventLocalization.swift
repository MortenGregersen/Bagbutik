public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventlocalizations_id_appeventvideoclips>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppEventVideoClipsForAppEventLocalization(id: String,
                                                              fields: [ListAppEventVideoClipsForAppEventLocalization.Field]? = nil,
                                                              includes: [ListAppEventVideoClipsForAppEventLocalization.Include]? = nil,
                                                              limit: Int? = nil) -> Request<AppEventVideoClipsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventLocalizations/\(id)/appEventVideoClips", method: .get, parameters: .init(fields: fields,
                                                                                                                 includes: includes,
                                                                                                                 limit: limit))
    }
}

public enum ListAppEventVideoClipsForAppEventLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
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

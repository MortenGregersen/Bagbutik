public extension Request {
    /**
      # Read App Clip Information
      Get a specific App Clip.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_clip_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related appClipDefaultExperiences returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipV1(id: String,
                             fields: [GetAppClipV1.Field]? = nil,
                             includes: [GetAppClipV1.Include]? = nil,
                             limit: Int? = nil) -> Request<AppClipResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClips/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                 includes: includes,
                                                                                 limit: limit))
    }
}

public enum V1GetAppClip {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAdvancedExperiences
        case appClipAdvancedExperiences([AppClipAdvancedExperiences])
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])

        public enum AppClipAdvancedExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case businessCategory
            case defaultLanguage
            case headerImage
            case isPoweredBy
            case link
            case localizations
            case place
            case placeStatus
            case removed
            case status
            case version
        }

        public enum AppClipDefaultExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case appClipDefaultExperienceTemplate
            case releaseWithAppStoreVersion
        }

        public enum AppClips: String, ParameterValue, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, appClipDefaultExperiences
    }
}

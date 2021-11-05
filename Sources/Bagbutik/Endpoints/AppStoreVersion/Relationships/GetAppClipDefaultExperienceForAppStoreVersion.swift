public extension Request {
    /**
      # Get the Default App Clip Experience for an App Store Version
      Get the default App Clip experience for an App Store version of your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_the_default_app_clip_experience_for_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related appClipDefaultExperienceLocalizations returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipDefaultExperienceForAppStoreVersion(id: String,
                                                              fields: [GetAppClipDefaultExperienceForAppStoreVersion.Field]? = nil,
                                                              includes: [GetAppClipDefaultExperienceForAppStoreVersion.Include]? = nil,
                                                              limit: Int? = nil) -> Request<AppClipDefaultExperienceResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/appClipDefaultExperience", method: .get, parameters: .init(fields: fields,
                                                                                                                  includes: includes,
                                                                                                                  limit: limit))
    }
}

public enum GetAppClipDefaultExperienceForAppStoreVersion {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperienceLocalizations
        case appClipDefaultExperienceLocalizations([AppClipDefaultExperienceLocalizations])
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])

        public enum AppClipDefaultExperienceLocalizations: String, ParameterValue, CaseIterable {
            case appClipDefaultExperience
            case appClipHeaderImage
            case locale
            case subtitle
        }

        public enum AppClipDefaultExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case appClipDefaultExperienceTemplate
            case releaseWithAppStoreVersion
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appClip, appClipAppStoreReviewDetail, appClipDefaultExperienceLocalizations, releaseWithAppStoreVersion
    }
}

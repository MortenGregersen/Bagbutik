public extension Request {
    /**
      # List All Default App Clip Experiences for an App Clip
      Get all default App Clip experiences for an App Clip.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_default_app_clip_experiences_for_an_app_clip>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter exists: Attributes, relationships, and IDs to check for existence
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppClipDefaultExperiencesForAppClip(id: String,
                                                        fields: [ListAppClipDefaultExperiencesForAppClip.Field]? = nil,
                                                        exists: [ListAppClipDefaultExperiencesForAppClip.Exist]? = nil,
                                                        includes: [ListAppClipDefaultExperiencesForAppClip.Include]? = nil,
                                                        limits: [ListAppClipDefaultExperiencesForAppClip.Limit]? = nil) -> Request<AppClipDefaultExperiencesResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClips/\(id)/appClipDefaultExperiences", method: .get, parameters: .init(fields: fields,
                                                                                                           exists: exists,
                                                                                                           includes: includes,
                                                                                                           limits: limits))
    }
}

public enum ListAppClipDefaultExperiencesForAppClip {
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
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'releaseWithAppStoreVersion'
        case releaseWithAppStoreVersion(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appClip, appClipAppStoreReviewDetail, appClipDefaultExperienceLocalizations, releaseWithAppStoreVersion
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appClipDefaultExperienceLocalizations returned (when they are included) - maximum 50
        case appClipDefaultExperienceLocalizations(Int)
    }
}

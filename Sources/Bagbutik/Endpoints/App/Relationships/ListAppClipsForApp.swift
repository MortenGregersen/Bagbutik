public extension Request {
    /**
      # Search an App’s App Clips
      Search your App’s associated App Clips.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/search_an_app_s_app_clips>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppClipsForApp(id: String,
                                   fields: [ListAppClipsForApp.Field]? = nil,
                                   filters: [ListAppClipsForApp.Filter]? = nil,
                                   includes: [ListAppClipsForApp.Include]? = nil,
                                   limits: [ListAppClipsForApp.Limit]? = nil) -> Request<AppClipsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/appClips", method: .get, parameters: .init(fields: fields,
                                                                                      filters: filters,
                                                                                      includes: includes,
                                                                                      limits: limits))
    }
}

public enum ListAppClipsForApp {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])

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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'bundleId'
        case bundleId([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, appClipDefaultExperiences
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appClipDefaultExperiences returned (when they are included) - maximum 50
        case appClipDefaultExperiences(Int)
    }
}

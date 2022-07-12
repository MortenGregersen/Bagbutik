public extension Request {
    /**
      # Read the App Store Review Detail for a Default App Clip Experience
      Get App Store Review details for a specific default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_review_detail_for_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipAppStoreReviewDetailForAppClipDefaultExperienceV1(id: String,
                                                                            fields: [GetAppClipAppStoreReviewDetailForAppClipDefaultExperienceV1.Field]? = nil,
                                                                            includes: [GetAppClipAppStoreReviewDetailForAppClipDefaultExperienceV1.Include]? = nil) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)/appClipAppStoreReviewDetail", method: .get, parameters: .init(fields: fields,
                                                                                                                              includes: includes))
    }
}

public enum GetAppClipAppStoreReviewDetailForAppClipDefaultExperienceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAppStoreReviewDetails
        case appClipAppStoreReviewDetails([AppClipAppStoreReviewDetails])
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])

        public enum AppClipAppStoreReviewDetails: String, ParameterValue, CaseIterable {
            case appClipDefaultExperience
            case invocationUrls
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
        case appClipDefaultExperience
    }
}

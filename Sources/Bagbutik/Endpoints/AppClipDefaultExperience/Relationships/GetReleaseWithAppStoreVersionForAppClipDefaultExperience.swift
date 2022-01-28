public extension Request {
    /**
      # Read App Store Version Information for a Default App Clip Experience
      Get App Store Version information for a default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_store_version_information_for_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getReleaseWithAppStoreVersionForAppClipDefaultExperience(id: String,
                                                                         fields: [GetReleaseWithAppStoreVersionForAppClipDefaultExperience.Field]? = nil,
                                                                         includes: [GetReleaseWithAppStoreVersionForAppClipDefaultExperience.Include]? = nil,
                                                                         limits: [GetReleaseWithAppStoreVersionForAppClipDefaultExperience.Limit]? = nil) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)/releaseWithAppStoreVersion", method: .get, parameters: .init(fields: fields,
                                                                                                                             includes: includes,
                                                                                                                             limits: limits))
    }
}

public enum GetReleaseWithAppStoreVersionForAppClipDefaultExperience {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])

        public enum AppStoreVersionExperiments: String, ParameterValue, CaseIterable {
            case appStoreVersion
            case appStoreVersionExperimentTreatments
            case endDate
            case name
            case reviewRequired
            case startDate
            case started
            case state
            case trafficProportion
        }

        public enum AppStoreVersionLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case promotionalText
            case supportUrl
            case whatsNew
        }

        public enum AppStoreVersions: String, ParameterValue, CaseIterable {
            case ageRatingDeclaration
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case copyright
            case createdDate
            case downloadable
            case earliestReleaseDate
            case idfaDeclaration
            case platform
            case releaseType
            case routingAppCoverage
            case usesIdfa
            case versionString
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case ageRatingDeclaration, app, appClipDefaultExperience, appStoreReviewDetail, appStoreVersionExperiments, appStoreVersionLocalizations, appStoreVersionPhasedRelease, appStoreVersionSubmission, build, idfaDeclaration, routingAppCoverage
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreVersionLocalizations returned (when they are included) - maximum 50
        case appStoreVersionLocalizations(Int)
        /// Maximum number of related appStoreVersionExperiments returned (when they are included) - maximum 50
        case appStoreVersionExperiments(Int)
    }
}

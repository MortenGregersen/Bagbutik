import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Default App Clip Experience Information
     Get a specific default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipDefaultExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appClipDefaultExperienceLocalizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDefaultExperienceV1(id: String,
                                              fields: [GetAppClipDefaultExperienceV1.Field]? = nil,
                                              includes: [GetAppClipDefaultExperienceV1.Include]? = nil,
                                              limit: GetAppClipDefaultExperienceV1.Limit? = nil) -> Request<AppClipDefaultExperienceResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipDefaultExperiences/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                           includes: includes,
                                                                                           limits: limit.map { [$0] }))
    }
}

public enum GetAppClipDefaultExperienceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAppStoreReviewDetails
        case appClipAppStoreReviewDetails([AppClipAppStoreReviewDetails])
        /// The fields to include for returned resources of type appClipDefaultExperienceLocalizations
        case appClipDefaultExperienceLocalizations([AppClipDefaultExperienceLocalizations])
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])

        public enum AppClipAppStoreReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appClipDefaultExperience
            case invocationUrls
        }

        public enum AppClipDefaultExperienceLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appClipDefaultExperience
            case appClipHeaderImage
            case locale
            case subtitle
        }

        public enum AppClipDefaultExperiences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case releaseWithAppStoreVersion
        }

        public enum AppStoreVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case alternativeDistributionPackage
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case appVersionState
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case gameCenterAppVersion
            case platform
            case releaseType
            case reviewType
            case routingAppCoverage
            case versionString
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appClip
        case appClipAppStoreReviewDetail
        case appClipDefaultExperienceLocalizations
        case releaseWithAppStoreVersion
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appClipDefaultExperienceLocalizations returned (when they are included) - maximum 50
        case appClipDefaultExperienceLocalizations(Int)
    }
}

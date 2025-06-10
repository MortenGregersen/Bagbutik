import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Default App Clip Experiences for an App Clip
     Get all default App Clip experiences for an App Clip.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClips-_id_-appClipDefaultExperiences>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppClipDefaultExperiencesForAppClipV1(id: String,
                                                          fields: [ListAppClipDefaultExperiencesForAppClipV1.Field]? = nil,
                                                          exists: [ListAppClipDefaultExperiencesForAppClipV1.Exist]? = nil,
                                                          includes: [ListAppClipDefaultExperiencesForAppClipV1.Include]? = nil,
                                                          limits: [ListAppClipDefaultExperiencesForAppClipV1.Limit]? = nil) -> Request<AppClipDefaultExperiencesResponse, ErrorResponse> {
        .init(
            path: "/v1/appClips/\(id)/appClipDefaultExperiences",
            method: .get,
            parameters: .init(
                fields: fields,
                exists: exists,
                includes: includes,
                limits: limits))
    }
}

public enum ListAppClipDefaultExperiencesForAppClipV1 {
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
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])
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

        public enum AppClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
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
            case usesIdfa
            case versionString
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}

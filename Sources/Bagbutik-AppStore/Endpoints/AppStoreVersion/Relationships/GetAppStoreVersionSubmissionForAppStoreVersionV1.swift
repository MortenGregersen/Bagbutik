import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Store Version Submission Information of an App Store Version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-appStoreVersionSubmission>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppStoreVersionSubmissionForAppStoreVersionV1(id: String,
                                                                 fields: [GetAppStoreVersionSubmissionForAppStoreVersionV1.Field]? = nil,
                                                                 includes: [GetAppStoreVersionSubmissionForAppStoreVersionV1.Include]? = nil) -> Request<AppStoreVersionSubmissionResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/appStoreVersionSubmission", method: .get, parameters: .init(fields: fields,
                                                                                                            includes: includes))
    }
}

public enum GetAppStoreVersionSubmissionForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionSubmissions
        case appStoreVersionSubmissions([AppStoreVersionSubmissions])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])

        public enum AppStoreVersionSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
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
        case appStoreVersion
    }
}

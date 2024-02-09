import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Store Review Details Resource Information of an App Store Version
     Get the details you provide to App Review so they can test your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_review_details_resource_information_of_an_app_store_version>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appStoreReviewAttachments returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewDetailForAppStoreVersionV1(id: String,
                                                            fields: [GetAppStoreReviewDetailForAppStoreVersionV1.Field]? = nil,
                                                            includes: [GetAppStoreReviewDetailForAppStoreVersionV1.Include]? = nil,
                                                            limit: Int? = nil) -> Request<AppStoreReviewDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/appStoreReviewDetail", method: .get, parameters: .init(fields: fields,
                                                                                                       includes: includes,
                                                                                                       limit: limit))
    }
}

public enum GetAppStoreReviewDetailForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreReviewAttachments
        case appStoreReviewAttachments([AppStoreReviewAttachments])
        /// The fields to include for returned resources of type appStoreReviewDetails
        case appStoreReviewDetails([AppStoreReviewDetails])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])

        public enum AppStoreReviewAttachments: String, ParameterValue, Codable, CaseIterable {
            case appStoreReviewDetail
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }

        public enum AppStoreReviewDetails: String, ParameterValue, Codable, CaseIterable {
            case appStoreReviewAttachments
            case appStoreVersion
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes
        }

        public enum AppStoreVersions: String, ParameterValue, Codable, CaseIterable {
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
        case appStoreReviewAttachments
        case appStoreVersion
    }
}

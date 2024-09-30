import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Beta App Review Submission Information
     Get a specific beta app review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_review_submission_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewSubmissionV1(id: String,
                                             fields: [GetBetaAppReviewSubmissionV1.Field]? = nil,
                                             includes: [GetBetaAppReviewSubmissionV1.Include]? = nil) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse>
    {
        .init(path: "/v1/betaAppReviewSubmissions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                          includes: includes))
    }
}

public enum GetBetaAppReviewSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppReviewSubmissions
        case betaAppReviewSubmissions([BetaAppReviewSubmissions])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BetaAppReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case betaReviewState
            case build
            case submittedDate
        }

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case computedMinMacOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
    }
}

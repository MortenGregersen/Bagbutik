import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Build Information of a Beta App Review Submission
     Get the build information for a specific beta app review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppReviewSubmissions-_id_-build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildForBetaAppReviewSubmissionV1(id: String,
                                                     fields: [GetBuildForBetaAppReviewSubmissionV1.Field]? = nil) -> Request<BuildWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewSubmissions/\(id)/build",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBuildForBetaAppReviewSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])

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
            case computedMinVisionOsVersion
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
}

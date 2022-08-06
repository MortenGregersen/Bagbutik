import Bagbutik_Models

public extension Request {
    /**
     # Read Xcode Cloud Build Information
     Get information about a specific Xcode Cloud build.

     The example request below retrieves detailed information for a specific build. Use the data provided in the response to display detailed build information on a dashboard or to access related information for each action Xcode Cloud performed.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_build_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related builds returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiBuildRunV1(id: String,
                                fields: [GetCiBuildRunV1.Field]? = nil,
                                includes: [GetCiBuildRunV1.Include]? = nil,
                                limit: Int? = nil) -> Request<CiBuildRunResponse, ErrorResponse>
    {
        .init(path: "/v1/ciBuildRuns/\(id)", method: .get, parameters: .init(fields: fields,
                                                                             includes: includes,
                                                                             limit: limit))
    }
}

public enum GetCiBuildRunV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type ciBuildActions
        case ciBuildActions([CiBuildActions])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])

        public enum Builds: String, ParameterValue, CaseIterable {
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

        public enum CiBuildActions: String, ParameterValue, CaseIterable {
            case actionType
            case artifacts
            case buildRun
            case completionStatus
            case executionProgress
            case finishedDate
            case isRequiredToPass
            case issueCounts
            case issues
            case name
            case startedDate
            case testResults
        }

        public enum CiBuildRuns: String, ParameterValue, CaseIterable {
            case actions
            case buildRun
            case builds
            case cancelReason
            case clean
            case completionStatus
            case createdDate
            case destinationBranch
            case destinationCommit
            case executionProgress
            case finishedDate
            case isPullRequestBuild
            case issueCounts
            case number
            case product
            case pullRequest
            case sourceBranchOrTag
            case sourceCommit
            case startReason
            case startedDate
            case workflow
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case builds
        case destinationBranch
        case product
        case pullRequest
        case sourceBranchOrTag
        case workflow
    }
}

public extension Request {
    /**
      # Read the Xcode Cloud Build Information for a Build Action
      Get Xcode Cloud build information for a given build action.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_xcode_cloud_build_information_for_a_build_action>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related builds returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildRunForCiBuildAction(id: String,
                                            fields: [GetBuildRunForCiBuildAction.Field]? = nil,
                                            includes: [GetBuildRunForCiBuildAction.Include]? = nil,
                                            limit: Int? = nil) -> Request<CiBuildRunResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciBuildActions/\(id)/buildRun", method: .get, parameters: .init(fields: fields,
                                                                                                includes: includes,
                                                                                                limit: limit))
    }
}

public enum GetBuildRunForCiBuildAction {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])
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
        case builds, destinationBranch, product, pullRequest, sourceBranchOrTag, workflow
    }
}

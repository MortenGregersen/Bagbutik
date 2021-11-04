public extension Request {
    /**
      # List All Xcode Cloud Builds for an Xcode Cloud Product
      List all builds Xcode Cloud performed for a specific product.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_xcode_cloud_builds_for_an_xcode_cloud_product>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildRunsForCiProduct(id: String,
                                          fields: [ListBuildRunsForCiProduct.Field]? = nil,
                                          filters: [ListBuildRunsForCiProduct.Filter]? = nil,
                                          includes: [ListBuildRunsForCiProduct.Include]? = nil,
                                          limits: [ListBuildRunsForCiProduct.Limit]? = nil) -> Request<CiBuildRunsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciProducts/\(id)/buildRuns", method: .get, parameters: .init(fields: fields,
                                                                                             filters: filters,
                                                                                             includes: includes,
                                                                                             limits: limits))
    }
}

public enum ListBuildRunsForCiProduct {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'builds'
        case builds([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case builds, destinationBranch, product, pullRequest, sourceBranchOrTag, workflow
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Xcode Cloud Product Information
     Get information about a specific Xcode Cloud product.

     The example request below retrieves information about a specific Xcode Cloud product. Use the data provided in the response to read additional information; for example, workflow information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_product_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related primaryRepositories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiProductV1(id: String,
                               fields: [GetCiProductV1.Field]? = nil,
                               includes: [GetCiProductV1.Include]? = nil,
                               limit: Int? = nil) -> Request<CiProductResponse, ErrorResponse>
    {
        .init(path: "/v1/ciProducts/\(id)", method: .get, parameters: .init(fields: fields,
                                                                            includes: includes,
                                                                            limit: limit))
    }
}

public enum GetCiProductV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type ciWorkflows
        case ciWorkflows([CiWorkflows])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appAvailability
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case availableInNewTerritories
            case availableTerritories
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }

        public enum CiBuildRuns: String, ParameterValue, Codable, CaseIterable {
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

        public enum CiProducts: String, ParameterValue, Codable, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows
        }

        public enum CiWorkflows: String, ParameterValue, Codable, CaseIterable {
            case actions
            case branchStartCondition
            case buildRuns
            case clean
            case containerFilePath
            case description
            case isEnabled
            case isLockedForEditing
            case lastModifiedDate
            case macOsVersion
            case name
            case product
            case pullRequestStartCondition
            case repository
            case scheduledStartCondition
            case tagStartCondition
            case xcodeVersion
        }

        public enum ScmRepositories: String, ParameterValue, Codable, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case bundleId
        case primaryRepositories
    }
}

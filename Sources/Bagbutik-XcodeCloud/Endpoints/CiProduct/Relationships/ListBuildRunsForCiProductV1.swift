import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Xcode Cloud Builds for an Xcode Cloud Product
     List all builds Xcode Cloud performed for a specific product.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_-buildRuns>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildRunsForCiProductV1(id: String,
                                            fields: [ListBuildRunsForCiProductV1.Field]? = nil,
                                            filters: [ListBuildRunsForCiProductV1.Filter]? = nil,
                                            includes: [ListBuildRunsForCiProductV1.Include]? = nil,
                                            sorts: [ListBuildRunsForCiProductV1.Sort]? = nil,
                                            limits: [ListBuildRunsForCiProductV1.Limit]? = nil) -> Request<CiBuildRunsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)/buildRuns",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListBuildRunsForCiProductV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type ciWorkflows
        case ciWorkflows([CiWorkflows])
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])
        /// The fields to include for returned resources of type scmPullRequests
        case scmPullRequests([ScmPullRequests])

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
            case buildUpload
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Builds(rawValue: string) {
                    self = value
                } else if let value = Builds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Builds value: \(string)"
                    )
                }
            }
        }

        public enum CiBuildRuns: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actions
            case builds
            case cancelReason
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiBuildRuns(rawValue: string) {
                    self = value
                } else if let value = CiBuildRuns(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiBuildRuns value: \(string)"
                    )
                }
            }
        }

        public enum CiProducts: String, Sendable, ParameterValue, Codable, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiProducts(rawValue: string) {
                    self = value
                } else if let value = CiProducts(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiProducts value: \(string)"
                    )
                }
            }
        }

        public enum CiWorkflows: String, Sendable, ParameterValue, Codable, CaseIterable {
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
            case manualBranchStartCondition
            case manualPullRequestStartCondition
            case manualTagStartCondition
            case name
            case product
            case pullRequestStartCondition
            case repository
            case scheduledStartCondition
            case tagStartCondition
            case xcodeVersion

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiWorkflows(rawValue: string) {
                    self = value
                } else if let value = CiWorkflows(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiWorkflows value: \(string)"
                    )
                }
            }
        }

        public enum ScmGitReferences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmGitReferences(rawValue: string) {
                    self = value
                } else if let value = ScmGitReferences(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmGitReferences value: \(string)"
                    )
                }
            }
        }

        public enum ScmPullRequests: String, Sendable, ParameterValue, Codable, CaseIterable {
            case destinationBranchName
            case destinationRepositoryName
            case destinationRepositoryOwner
            case isClosed
            case isCrossRepository
            case number
            case repository
            case sourceBranchName
            case sourceRepositoryName
            case sourceRepositoryOwner
            case title
            case webUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmPullRequests(rawValue: string) {
                    self = value
                } else if let value = ScmPullRequests(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmPullRequests value: \(string)"
                    )
                }
            }
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case builds
        case destinationBranch
        case product
        case pullRequest
        case sourceBranchOrTag
        case workflow
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case numberAscending = "number"
        case numberDescending = "-number"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}

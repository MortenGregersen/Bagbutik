import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Xcode Cloud Build Information
     Get information about a specific Xcode Cloud build.

     The example request below retrieves detailed information for a specific build. Use the data provided in the response to display detailed build information on a dashboard or to access related information for each action Xcode Cloud performed.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildRuns-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related builds returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiBuildRunV1(id: String,
                                fields: [GetCiBuildRunV1.Field]? = nil,
                                includes: [GetCiBuildRunV1.Include]? = nil,
                                limit: GetCiBuildRunV1.Limit? = nil) -> Request<CiBuildRunResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildRuns/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetCiBuildRunV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])

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
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
    }
}

import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Xcode Cloud Workflow Information
     Get information about a specific Xcode Cloud workflow.

     The example request below accesses information about an Xcode Cloud workflow. Display the workflow data provided in the response on a dashboard or use it to read additional information; for example, detailed data about builds Xcode Cloud performed.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_workflow_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiWorkflowV1(id: String,
                                fields: [GetCiWorkflowV1.Field]? = nil,
                                includes: [GetCiWorkflowV1.Include]? = nil) -> Request<CiWorkflowResponse, ErrorResponse>
    {
        .init(path: "/v1/ciWorkflows/\(id)", method: .get, parameters: .init(fields: fields,
                                                                             includes: includes))
    }
}

public enum GetCiWorkflowV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])
        /// The fields to include for returned resources of type ciWorkflows
        case ciWorkflows([CiWorkflows])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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
        case macOsVersion
        case product
        case repository
        case xcodeVersion
    }
}

import Bagbutik_Core

public extension Request {
    /**
     # Read the Repository Information for an Xcode Cloud Workflow
     Get information about the Git repository of a specific Xcode Cloud workflow.

     The example request below retrieves information about an Xcode Cloud workflow’s repository. Use the data provided in the response to read additional information; for example, pull request information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_repository_information_for_an_xcode_cloud_workflow>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRepositoryForCiWorkflowV1(id: String,
                                             fields: [GetRepositoryForCiWorkflowV1.Field]? = nil,
                                             includes: [GetRepositoryForCiWorkflowV1.Include]? = nil) -> Request<ScmRepositoryResponse, ErrorResponse>
    {
        .init(path: "/v1/ciWorkflows/\(id)/repository", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetRepositoryForCiWorkflowV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])
        /// The fields to include for returned resources of type scmProviders
        case scmProviders([ScmProviders])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmGitReferences: String, ParameterValue, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository
        }

        public enum ScmProviders: String, ParameterValue, CaseIterable {
            case repositories
            case scmProviderType
            case url
        }

        public enum ScmRepositories: String, ParameterValue, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case defaultBranch
        case scmProvider
    }
}

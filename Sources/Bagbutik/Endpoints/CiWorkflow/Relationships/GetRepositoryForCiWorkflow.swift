public extension Request {
    /**
      # Read the Repository Information for an Xcode Cloud Workflow
      Get information about the Git repository of a specific Xcode Cloud workflow.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_repository_information_for_an_xcode_cloud_workflow>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getRepositoryForCiWorkflow(id: String,
                                           fields: [GetRepositoryForCiWorkflow.Field]? = nil) -> Request<ScmRepositoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciWorkflows/\(id)/repository", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetRepositoryForCiWorkflow {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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
}
